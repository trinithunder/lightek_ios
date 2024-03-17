//
//  LTekDataLayer.swift
//  Lightek
//
//  Created by Marlon Henry on 3/17/24.
//

import Foundation
import SwiftUI

struct User:Codable,Hashable{
    var id = UUID().uuidString
    var displayName:String
    var screenName:String
    var userImage:String
    var borderWidth: CGFloat = 0.3
    
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
    
    
}
