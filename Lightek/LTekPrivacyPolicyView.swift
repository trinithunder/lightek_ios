//
//  LTekPrivacyPolicyView.swift
//  Lightek
//
//  Created by Marlon Henry on 3/26/24.
//

import SwiftUI

struct LTekPrivacyPolicyView: View {
    var body: some View {
        ScrollView{
            VStack(spacing:20){
                Spacer().frame(height:20)
                Text("Privacy Policy").font(.largeTitle)
                Text("Introduction")
                Group{
                    HStack{
                        Spacer()
                        Text("SMULL is committed to protecting the privacy of our users. This Privacy Policy outlines the types of information we collect, how we use it, and how we protect your privacy.").multilineTextAlignment(.center)
                        Spacer()
                    }
                    Text("Information We Collect")
                    Group{
                        HStack{
                            Spacer()
                            Text("Personal Information: When you create an account on SMULL, we may collect personal information such as your name, email address, and profile picture.").multilineTextAlignment(.center)
                            Spacer()
                        }
                    }
                }
                
            }
        }
    }
}

struct LTekPrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        LTekPrivacyPolicyView()
    }
}
