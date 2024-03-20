//
//  LTekDataLayer.swift
//  Lightek
//
//  Created by Marlon Henry on 3/17/24.
//

import Foundation
import SwiftUI
protocol LTekApiProtocol:GK {
    func setData()
    func readData()
    
    
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
    var currentUser = User(displayName: "Marlon", screenName: "", userImage: "https://wallpapercave.com/wp/wp3324196.jpg")
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
    var displayName:String
    var screenName:String
    var userImage:String
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
        AsyncImage(url: URL(string: userImage)) { image in
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
        AsyncImage(url: URL(string: userImage)) { image in
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
        AsyncImage(url: URL(string: userImage)) { image in
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
struct ApiManager:LTekApiProtocol{
    func setData() {
        //
    }
    
    func readData() {
        //
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
