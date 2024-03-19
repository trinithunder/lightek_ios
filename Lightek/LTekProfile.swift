//
//  LTekProfile.swift
//  Lightek
//
//  Created by Marlon Henry on 3/19/24.
//

import SwiftUI

struct LTekProfile: View {
    var body: some View {
        ScrollView{
            VStack(spacing:20){
                Spacer().frame(height:50)
                GateKeeper().currentUser.userProfileImage()
                Text(GateKeeper().currentUser.displayName)
            }
        }
    }
}

struct LTekProfile_Previews: PreviewProvider {
    static var previews: some View {
        LTekProfile()
    }
}
