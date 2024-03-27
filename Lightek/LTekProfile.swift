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
    @State var loggedInIndex = User.loggedInIndex
    @State var hasNotifications = false
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
                        }
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
                    returnGroup3(item: item)
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
            }
            HStack{
                VStack{
                    Text(item.bio ?? "897")
                        .foregroundColor(.black)
                    Text(item.bio ?? "Posts")
                        .foregroundColor(.black)
                }
                
                VStack{
                    Text(item.bio ?? "8970")
                        .foregroundColor(.black)
                    Text(item.bio ?? "Followers")
                        .foregroundColor(.black)
                }
                
                VStack{
                    Text(item.bio ?? "897")
                        .foregroundColor(.black)
                    Text(item.bio ?? "Following")
                        .foregroundColor(.black)
                }
                
                VStack{
                    Text(item.bio ?? "10897")
                        .foregroundColor(.black)
                    Text(item.bio ?? "Likes")
                        .foregroundColor(.black)
                }
            }
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
