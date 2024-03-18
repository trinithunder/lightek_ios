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
    var currentUser = User(displayName: "", screenName: "", userImage: "")
    var systemInfo = LTekSystemInfo()
    var viewMode:ViewModes = .dashboard
    
    func shangTsung() -> some View {
        switch viewMode {
        case .dashboard: break
            //present dashboard view
        }
        return EmptyView()
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

struct ApiManager:LTekApiProtocol{
    func setData() {
        //
    }
    
    func readData() {
        //
    }
    
   
}

