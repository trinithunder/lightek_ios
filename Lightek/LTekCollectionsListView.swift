//
//  LTekCollectionsListView.swift
//  Lightek
//
//  Created by Marlon Henry on 3/17/24.
//

import SwiftUI

struct LTekCollectionsListView: View {
    @State var items:[User] = [User(displayName: "Display name for this", screenName: "Haveyec still", userImage: "https://media.licdn.com/dms/image/D5612AQGuWODEv7stvA/article-cover_image-shrink_720_1280/0/1691853294612?e=1716422400&v=beta&t=5YT9-HlaKxj1NAAPDUFHUxG3loVzmIM8ce19Jdhu2W4"),User(displayName: "Hav", screenName: "Sexy ass Marlon", userImage: "https://wallpapercave.com/wp/wp3324196.jpg")]
    @State var workFlow:[Int] = [1,2,3,4,5,6,7,8]
    @State var isFollowing = true
    var body: some View {
        List{
            ForEach(items, id: \.self){
                item in
                Button {
                    // Going to do something here with workFlow
                } label: {
                    HStack{
                        item.userAvatar()
                            .padding(.trailing,5)
                        VStack(spacing:10){
                            Text(item.displayName!)
                                .foregroundColor(.black)
                                .font(.system(size:12))
                                .padding(.trailing,10)
                            Text("Time of post of conent")
                                
                                .foregroundColor(.black)
                                .font(.system(size:10))
                            
                        }
                        Button{
                            
                        } label:{
                            HStack{
                                Spacer()
                                Capsule()
                                    .frame(width:78,height:34)
                                    .foregroundColor(isFollowing ? Color.green : Color.white)
                                    .overlay(
                                        Text(isFollowing ? "Following":"Follow").font(.system(size:10))
                                            .foregroundColor(isFollowing ? .white:.black)
                                    )
                            }
                            
                        }
                        
                    }
                    item.userContent()
                        .padding(.bottom,20)
                    Text("A bunch of post comment stuff")
                        .foregroundColor(.black)
                        .padding(.bottom,20)
                    
                    HStack{
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
        
    }
}

struct LTekCollectionsListView_Previews: PreviewProvider {
    static var previews: some View {
        LTekCollectionsListView()
    }
}
