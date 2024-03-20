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
                    HStack{
                        item.userAvatar()
                            .padding(.trailing,5)
                        VStack(spacing:10){
                            Text(item.displayName)
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

struct LTekProfile_Previews: PreviewProvider {
    static var previews: some View {
        LTekProfile()
    }
}
