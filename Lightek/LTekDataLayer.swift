//
//  LTekDataLayer.swift
//  Lightek
//
//  Created by Marlon Henry on 3/17/24.
//

import Foundation
import SwiftUI
typealias T = User

class Gate_Keeper: ObservableObject {
    @Published var currentUser = ""
}

struct FirebaseResponse: Codable {
    let kind: String
    let localId: String
    let email: String
    let displayName: String?
    let idToken:String
    let registered:Bool
    let refreshToken:String
    let expiresIn:String
    // Add other properties as needed
}


protocol LTekApiProtocol:GK {
    func setData(collection: String,params:[String:Any],image: UIImage?)
    func readData<T: Codable>(forType type: T.Type, fromCollection collection: String, completion: @escaping ([T]?, Error?) -> Void)
}
protocol ApiStructure{
    var baseUrl: String { get set }
}
protocol GK:Codable,Hashable {
    
}
enum ViewModes:GK {
case dashboard
}
struct GateKeeper:GK{
    var currentUser = User(displayName: "Marlon", screenName: "", userImage: "https://wallpapercave.com/wp/wp3324196.jpg") //<--we need to filter out the array of users that User.loadThatJSON returns by user ID
    var systemInfo = LTekSystemInfo()
    var viewMode:ViewModes = .dashboard
    static var currentActivityStatus:Bool{
        return User.loggedInIndex
        
    }
    
    func shangTsung() -> some View {
        switch viewMode {
        case .dashboard: break
            //present dashboard view
        }
        return LTekHomeHub()
    }
}
struct LTekSystemInfo:GK {
    var name = ""
        var model = ""
        var system_name = ""
        var system_version = ""
        var identifier_for_vendor = ""
        var localized_model = ""
        var user_interface_idiom = ""
    }
struct User:GK{
    var id = UUID().uuidString
    var displayName:String?
    var screenName:String?
    var userImage:String?
    var borderWidth: CGFloat = 0.3
    var apiManager = ApiManager()
    var firstName: String?
    var lastName: String?
    var bio: String?
    var userName: String?
    var fb: String?
    var twitter: String?
    var instagram: String?
    var messageId: Int?
    var likeId: Int?
    var matchId: Int?
    var phoneNumber: String?
    var followsId: Int?
    var groupId: Int?
    var interestId: Int?
    var productId: Int?
    var relationships = RelationshipManager()
    
    func userAvatar()->some View{
        AsyncImage(url: URL(string: userImage!)) { image in
            image
                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .overlay(Circle().strokeBorder(Color.white, lineWidth: borderWidth))
        } placeholder: {
            ProgressView()
        }
    }
    
    func userProfileImage()->some View{
        AsyncImage(url: URL(string: userImage!)) { image in
            image
                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                                .overlay(Circle().strokeBorder(Color.white, lineWidth: borderWidth))
        } placeholder: {
            ProgressView()
        }
    }
    
    func userContent()->some View{
        AsyncImage(url: URL(string: userImage!)) { image in
            image
                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 325, height: 271)
                                .clipShape(Rectangle())
                                .overlay(Rectangle().strokeBorder(Color.white, lineWidth: borderWidth))
                                .padding(.top,20)
        } placeholder: {
            ProgressView()
        }
    }
    func userProfileHeaderBG()->some View{
        AsyncImage(url: URL(string: "https://media.istockphoto.com/id/502846306/photo/lower-manhattan-skyline.jpg?s=612x612&w=0&k=20&c=RdzbupJ24bBmg9_17nxvOqdpMjhZMw78Pb3QlxgSIV8=")) { image in
            image
                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 325, height: 271)
                                .clipShape(Rectangle())
                                .overlay(Rectangle().strokeBorder(Color.white, lineWidth: borderWidth))
                                .padding(.top,20)
        } placeholder: {
            ProgressView()
        }
    }
    
    func postData(){
        
    }
    
    func loadThatJson()->[User]{
        var arrayOfUser = [User]()
        apiManager.readData(forType: User.self, fromCollection: "user") { codableOb, error in
            //Do some work here
            guard let userArr = codableOb else { return }
            arrayOfUser = userArr
        }
        return arrayOfUser
    }
    
    func signInUser(email:String,password:String,gk:Gate_Keeper){
        let signInUrl = URL(string: "\(Firestore.signInURL)?key=\(Firestore.apiKey)")!
        
        let parameters = "{\n  \"email\": \"\(email)\",\n  \"password\": \"\(password)\",\n  \"returnSecureToken\": true\n}\n"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url:signInUrl,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
            //so in here we need to set "currentUser" with localID in GateKeeper env object
            // Assuming `data` is the JSON data received from Firebase
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(FirebaseResponse.self, from: data)
                let localId = response.localId
                DispatchQueue.main.async {
                    gk.currentUser = localId
                    print("localId:", gk.currentUser)
                }
                
                
            } catch {
                print("Error decoding JSON:", error)
            }

        }

        task.resume()

    }
    
    func createUser(email:String,password:String,gk:Gate_Keeper,completion:()->()){
        let signUpUrl = URL(string: "\(Firestore.signInURL)?key=\(Firestore.apiKey)")!
        
        let parameters = "{\n  \"email\": \"\(email)\",\n  \"password\": \"\(password)\",\n  \"returnSecureToken\": true\n}\n"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url:signUpUrl,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(FirebaseResponse.self, from: data)
                let localId = response.localId
                let dataObjectForCloud:[String:Any] = ["userID":localId,"email":response.email]
                apiManager.postDataToFirestore(collection: "User", data: dataObjectForCloud)
                DispatchQueue.main.async {
                    gk.currentUser = localId
                    print("localId:", gk.currentUser)
                }
                
                
            } catch {
                print("Error decoding JSON:", error)
            }

        }

        task.resume()
    }
    
    
}
extension User {
    static var emailIndex: String { "index_users_on_email" }
    static var followsIdIndex: String { "index_users_on_follows_id" }
    static var groupIdIndex: String { "index_users_on_group_id" }
    static var interestIdIndex: String { "index_users_on_interest_id" }
    static var likeIdIndex: String { "index_users_on_like_id" }
    static var matchIdIndex: String { "index_users_on_match_id" }
    static var messageIdIndex: String { "index_users_on_message_id" }
    static var productIdIndex: String { "index_users_on_product_id" }
    static var resetPasswordTokenIndex: String { "index_users_on_reset_password_token" }
    static var loggedInIndex:Bool{
        return true
    }
}
struct Firestore:GK {
    static let storageUrl = "https://miquel-b7eaf-default-rtdb.firebaseio.com/images/"
    static let firebaseImgUrl = "https://miquel-b7eaf-default-rtdb.firebaseio.com/images/"
    static let firestoreUrl = "https://firestore.googleapis.com/v1/projects/miquel-b7eaf/databases/(default)/documents/"
    static let apiKey = "AIzaSyCXStMVELLq3mOJ5jJ8g9XO2aHlt5Hvbo4"
    static let signInURL = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword"
    static let signUpURL = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key={{apiKey}}"
}
struct ApiManager:LTekApiProtocol{
    func readData<T>(forType type: T.Type, fromCollection collection: String, completion: @escaping ([T]?, Error?) -> Void) where T : Decodable, T : Encodable {
        // Construct Firestore URL for fetching data
        let firestoreUrl = "\(Firestore.firestoreUrl)\(collection)?key=\(Firestore.apiKey)"
        
        // Create URL request
        guard let url = URL(string: firestoreUrl) else {
            completion(nil, URLError(.badURL))
            return
        }
        
        // Perform the request
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Check for error
            if let error = error {
                completion(nil, error)
                return
            }
            
            // Check for response status
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(nil, NSError(domain: "HTTPError", code: (response as? HTTPURLResponse)?.statusCode ?? 0, userInfo: nil))
                return
            }
            
            // Check for data
            guard let data = data else {
                completion(nil, NSError(domain: "NoDataError", code: 0, userInfo: nil))
                return
            }
            
            // Decode JSON data into [T] array
            do {
                let objects = try JSONDecoder().decode([String: T].self, from: data).compactMap { $0.value }
                completion(objects, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
    
    func setData(collection: String, params: [String: Any], image: UIImage? = nil) {
        // Upload image if provided
        if let image = image {
            uploadImageToFirebase(image) { imageUrl in
                var updatedParams = params
                updatedParams["imageUrl"] = imageUrl
                postDataToFirestore(collection: collection, data: updatedParams)
            }
        } else {
            // No image provided, post data to Firestore directly
            postDataToFirestore(collection: collection, data: params)
        }
    }

    private func uploadImageToFirebase(_ image: UIImage, completion: @escaping (String?) -> Void) {
        // Convert image to Data
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            print("Failed to convert image to data")
            completion(nil)
            return
        }

        // Generate a unique filename
        let filename = UUID().uuidString + ".jpg"

        // Firebase Storage URL for uploading
        let storageUrl = "\(Firestore.storageUrl)\(filename)"

        // Create a URL request
        var request = URLRequest(url: URL(string: storageUrl)!)
        request.httpMethod = "PUT"
        request.setValue("image/jpeg", forHTTPHeaderField: "Content-Type")
        request.httpBody = imageData

        // Perform the request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                print("Error uploading image: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }

            // If the upload is successful, construct the image URL
            let imageUrl = "\(Firestore.firebaseImgUrl)\(filename)"
            completion(imageUrl)
        }
        task.resume()
    }

     func postDataToFirestore(collection: String, data: [String: Any]) {
        // Convert parameters to JSON data
        guard let jsonData = try? JSONSerialization.data(withJSONObject: data) else {
            print("Failed to serialize parameters into JSON")
            return
        }

        // Construct Firestore URL for posting data
        let firestoreUrl = "\(Firestore.firestoreUrl)\(collection)?key=\(Firestore.apiKey)"

        // Create a URL request
        var request = URLRequest(url: URL(string: firestoreUrl)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        // Perform the request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            if let data = data {
                // Handle response data if needed
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                    print("Response JSON: \(json)")
                }
            }
        }
        task.resume()
    }
   
}

struct ActiveStorageAttachmentForeignKey {
    var blobId: Int
}
struct ActiveStorageVariantRecordsForeignKey {
    var blobId: Int
}
struct AnswerForeignKey {
    var questionId: Int
}
struct CardForeignKey {
    var userId: Int
}
struct CategoryForeignKey {
    var postId: Int
}
struct DeviceForeignKey {
    var userId: Int
}
struct FeeForeignKey {
    var userId: Int
}
struct HomeworkForeignKey {
    var categoryId: Int
    var userId: Int
}
struct PostCommentForeignKey {
    var postId: Int
    var userId: Int
}
struct PostForeignKey {
    var userId: Int
}
struct QuizForeignKey {
    var questionId: Int
}
struct UserCalendarForeignKey {
    var userId: Int
}
struct FollowsForeignKey {
    var followsId: Int
}
struct GroupForeignKey {
    var groupId: Int
}
struct InterestForeignKey {
    var interestId: Int
}
struct LikeForeignKey {
    var likeId: Int
}
struct MatchForeignKey {
    var matchId: Int
}
struct MessageForeignKey {
    var messageId: Int
}
struct ProductForeignKey {
    var productId: Int
}
struct RelationshipManager:GK{
    var friends = [1,2,3,4,5]
}
