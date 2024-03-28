//
//  LTekProfile.swift
//  Lightek
//
//  Created by Marlon Henry on 3/19/24.
//

import SwiftUI

struct LTekProfile: View {
    @State var items = [GateKeeper().currentUser]
    @State var isFollowing = true
    @State var loggedInIndex = !User.loggedInIndex
    @State var hasNotifications = false
    @State private var selectedSegment = 0
        let segments = ["Segment 1", "Segment 2", "Segment 3"]
    let imageURLsSets: [[String]] = [
            ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeQfOP-rwCLrJsEVkWW-zYCzUdLwVtbfwsUeGNxo0OkA&s", "https://upload.wikimedia.org/wikipedia/en/4/47/Iron_Man_%28circa_2018%29.png", "https://m.media-amazon.com/images/M/MV5BMjBlMTRjODMtMDMyYi00OGQ1LWJhNzYtYTYyMTcxOWI5MGM0XkEyXkFqcGdeQW1yb2Njbw@@._V1_QL75_UX500_CR0,0,500,281_.jpg","https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/80C64C0B63382CD3ED2653356125F275F63D036028A77D38DC3286AD851A6833/scale?width=1200&amp;aspectRatio=1.78&amp;format=webp","https://i.pinimg.com/originals/cd/9c/cf/cd9ccf566bacd605ff35c80b2f56a1dd.jpg"],
            ["https://media.uiargonaut.com/wp-content/uploads/2016/05/rawrfeb3.jpg", "https://www.usatoday.com/gcdn/-mm-/7efc53ff9ce744597ce691011ac1c7274e26a947/c=172-0-2828-1997/local/-/media/2016/02/11/USATODAY/USATODAY/635908058668140572-AP-FILM-REVIEW-DEADPOOL-79512492.JPG", "https://lumiere-a.akamaihd.net/v1/images/image_8c4aa72b.jpeg?region=0%2C0%2C800%2C1200"],
            ["https://static.wikia.nocookie.net/marveldatabase/images/8/85/Lucas_Bishop_%28Earth-1191%29_from_Marvel_Masterpieces_Trading_Cards_1992_0001.jpg/revision/latest?cb=20080506084634", "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/8207804c-8641-49d2-85c1-ba7d8cb0fe8c/dewqcmm-3f702d78-d102-4d6a-be68-2113fd8e8add.jpg/v1/fill/w_1920,h_2756,q_75,strp/classic_bishop_x_men_by_drmostafamortaja_dewqcmm-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9Mjc1NiIsInBhdGgiOiJcL2ZcLzgyMDc4MDRjLTg2NDEtNDlkMi04NWMxLWJhN2Q4Y2IwZmU4Y1wvZGV3cWNtbS0zZjcwMmQ3OC1kMTAyLTRkNmEtYmU2OC0yMTEzZmQ4ZThhZGQuanBnIiwid2lkdGgiOiI8PTE5MjAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.gEzyZuWwqTx3teo9WeM4IT2q48-lJXrglc-CFpwiO6g", "https://prod-cdn-02.storenvy.com/product_photos/65639832/file_7d886f37b8_original.jpg"]
        ] // Your arrays of image URLs for each segment
    var currentImageURLs: [String] {
            guard selectedSegment >= 0 && selectedSegment < imageURLsSets.count else {
                return []
            }
            return imageURLsSets[selectedSegment]
        }
    var body: some View {
        
        if loggedInIndex{
           returnListView()
        }else{
           LTekLogIn()
        }
    }
    
    func returnListView()->some View{
        //TODO: - Re design this whole profile template
        return List{
            ForEach(items, id: \.self){
                item in
                Button {
                    // Going to do something here with workFlow
                } label: {
                    Group{
                        HStack{
                            Image(systemName:"arrow.left")
                            Text(item.displayName!)
                                .foregroundColor(.black)
                                .font(.system(size:20))
                                .padding(.trailing,10)
                            Spacer()
                            Image(systemName:"message")
                            Image(systemName:hasNotifications ? "bell.badge":"bell")
                            Image(systemName:"ellipsis.circle")
                        }.padding(.top,20)
                        HStack{
                            item.userProfileHeaderBG().overlay(VStack{
                                Spacer()
                                item.userAvatar()
                                
                            })
                        }
                        HStack{
                            Text(item.userName ?? "@haveyec")
                                .foregroundColor(.black)
                            Image(systemName:"qrcode")
                                .foregroundColor(.orange)
                        }
                    }
                    returnGroup2(item: item)
                    //returnGroup3(item: item)
                  //  returnGroup4()
                      }

            }
        }
    }
    
    private func returnGroup2(item:User)->some View{
        return Group{
            HStack{
                Text(item.bio ?? "I run shit")
                    .foregroundColor(.black)
                    .padding(.bottom,20)
            }
            HStack{
                VStack(spacing:5){
                    Text(item.bio ?? "897")
                        .foregroundColor(.black)
                    Text(item.bio ?? "Posts")
                        .foregroundColor(.black)
                }
                
                VStack(spacing:5){
                    Text(item.bio ?? "8970")
                        .foregroundColor(.black)
                    Text(item.bio ?? "Followers")
                        .foregroundColor(.black)
                }
                
                VStack(spacing:5){
                    Text(item.bio ?? "897")
                        .foregroundColor(.black)
                    Text(item.bio ?? "Following")
                        .foregroundColor(.black)
                }
                
                VStack(spacing:5){
                    Text(item.bio ?? "10897")
                        .foregroundColor(.black)
                    Text(item.bio ?? "Likes")
                        .foregroundColor(.black)
                }
            }
            HStack{
                Button{
                    
                } label:{
                    HStack{
                        Capsule()
                            .frame(width:78,height:34)
                            .foregroundColor(isFollowing ? Color("AccentColor") : Color.white)
                            .overlay(
                                Text(isFollowing ? "Following":"Follow").font(.system(size:10))
                                    .foregroundColor(isFollowing ? .white:.black)
                            )
                            .padding(.leading,30)
                        Button{
                            
                        }label:{
                            Circle().frame(height:40).overlay(Image(systemName: "camera").foregroundColor(.white))
                        }
                        Button{
                            
                        }label:{
                            Circle().frame(height:40).overlay(Image(systemName: "heart").foregroundColor(.white))
                        }
                        Spacer()
                    }
                    
                }
                
            }
            VStack {
                        Picker(selection: $selectedSegment, label: Text("Segments")) {
                            ForEach(0..<segments.count) { index in
                                Text(self.segments[index]).tag(index)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 10) {
                                ForEach(currentImageURLs, id: \.self) { imageURLString in
                                    if let imageURL = URL(string: imageURLString) {
                                        AsyncImage(url: imageURL) { phase in
                                            switch phase {
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 123, height: 200)
                                                    .clipped()
                                            case .failure:
                                                // Placeholder or error handling image
                                                Color.gray
                                                    .frame(width: 123, height: 200)
                                            case .empty:
                                                // Placeholder or loading spinner
                                                Color.gray
                                                    .frame(width: 123, height: 200)
                                            @unknown default:
                                                // Placeholder or error handling image
                                                Color.gray
                                                    .frame(width: 123, height: 200)
                                            }
                                        }
                                    } else {
                                        // Placeholder or error handling image
                                        Color.gray
                                            .frame(width: 100, height: 100)
                                    }
                                }
                            }
                            .padding()
                    }
                    .padding()
        }
    }
    
    private func returnGroup3(item:User)->some View{
        return Group{
            item.userContent()
                .padding(.bottom,20)
            Text("A bunch of post comment stuff")
                .foregroundColor(.black)
                .padding(.bottom,20)
        }
    }
    
    private func returnGroup4()->some View{
        Group{
            return HStack{
                Image(systemName: "square.and.arrow.up.circle")
                    .font(.system(size: 10))
                    .foregroundColor(.black)
                Text("35")
                    .font(.system(size: 10))
                
                Spacer()
                
                Image(systemName: "heart")
                    .font(.system(size: 10))
                    .foregroundColor(.red)
                
                Text("85")
                    .font(.system(size: 10))
                
                Image(systemName: "text.bubble")
                    .font(.system(size: 10))
                    .foregroundColor(.black)
                
                Text("12")
                    .font(.system(size: 10))
            }
        }
    }
}

struct LTekProfile_Previews: PreviewProvider {
    static var previews: some View {
        LTekProfile()
    }
}
