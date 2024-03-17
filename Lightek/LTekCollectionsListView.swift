//
//  LTekCollectionsListView.swift
//  Lightek
//
//  Created by Marlon Henry on 3/17/24.
//

import SwiftUI

struct LTekCollectionsListView: View {
    @State var items:[User] = [User(displayName: "Display name for this", screenName: "Haveyec still", userImage: "https://wallpapercave.com/wp/wp3324196.jpg"),User(displayName: "Hav", screenName: "Sexy ass Marlon", userImage: "https://wallpapercave.com/wp/wp3324196.jpg")]
    @State var workFlow:[Int] = [1,2,3,4,5,6,7,8]
    @State var isFollowing = false
    var body: some View {
        List{
            ForEach(items, id: \.self){
                item in
                Button {
                    // Going to do something here with workFlow
                } label: {
                    HStack{
                        item.userAvatar()
                            .padding(.trailing,20)
                        VStack(spacing:10){
                            Text(item.displayName)
                                .foregroundColor(.black)
                                .font(.system(size:12))
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
