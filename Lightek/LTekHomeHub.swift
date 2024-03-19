//
//  LTekHomeHub.swift
//  Lightek
//
//  Created by Marlon Henry on 3/19/24.
//

import SwiftUI

struct LTekHomeHub: View {
    @State var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            LTekProfile().tabItem { Image(systemName:"person.crop.circle") }.tag(1)
            LTekCommunity().tabItem { Image(systemName:"network") }.tag(2)
            
        }
        
    }
}

struct LTekHomeHub_Previews: PreviewProvider {
    static var previews: some View {
        LTekHomeHub()
    }
}
