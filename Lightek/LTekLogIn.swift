//
//  LTekLogIn.swift
//  Lightek
//
//  Created by Marlon Henry on 3/19/24.
//

import SwiftUI

struct LTekLogIn: View {
    @State var notifyMeAbout = true
    @State var playNotificationSounds = false
    @State var sendReadReceipts = false
    @State var email = ""
    @State var password = ""
    @State var isSignUpVisible = false
    var body: some View {
        ScrollView{
            VStack(spacing:20){
                Group{
                    Spacer().frame(height:50)
                    HStack{
                        Spacer().frame(width:20)
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 45, height: 45)
                            .foregroundColor(.orange)
                            .shadow(color: .black, radius: 5, x: 0.5, y: 0.5)
                            .overlay(Image(systemName: "arrow.left")
                                        .foregroundColor(.white))
                        Spacer()
                    }
                    Text("Hello again!").font(.largeTitle)
                        .foregroundColor(.orange)
                    Text("Sign in to your account").font(.subheadline)
                        .foregroundColor(.gray)
                    RoundedRectangle(cornerRadius: 5)
                
                    .stroke(Color.orange, lineWidth: 1) // Add orange border with 1px width
                    .frame(width: 325,
                           height: 69)
                    .overlay(VStack{
                        HStack{
                            Text("Email address:")
                                .foregroundColor(.orange)
                                .padding(.leading,10)
                            Spacer()
                        }
                        TextField("example@domain.com", text: $email)
                            .padding(.leading,10)
                    })
                     // Adjust the corner radius as needed
                }
                Group{
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.orange, lineWidth: 1) // Add green border with 1px width
                        .frame(width: 325,
                               height: 69)
                        .overlay(
                            SecureField("Password", text: $password)
                                .foregroundColor(.orange)
                                .padding(.leading,10)
                        )
                }
                Group{
                    Button{
                    
                }label:{
                    HStack{
                        Text("Forgot your password?")
                            .foregroundColor(.orange)
                            .underline()
                            .padding(.leading,10)
                        Spacer()
                    }
                }
                    
                }
                Spacer().frame(height:20)
                Group{
                    Button{
                    
                }label:{
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.orange)
                        .frame(width: UIScreen.main.bounds.width - 20, height: 58)
                        .overlay(Text("Sign in")
                                    .foregroundColor(.white)
                        )
                }
                    
                }
                Group{
                    HStack{
                        Text("Don’t have account?")
                        Button{
                            isSignUpVisible.toggle()
                        }label:{
                            Text("Let’s Sign up")
                        }
                    }.fullScreenCover(isPresented: $isSignUpVisible, onDismiss: nil) {
                        LTekSignUp(isSignUpVisible:$isSignUpVisible)
                    }
                     
                }
                
            }
        }
    }
}

struct LTekLogIn_Previews: PreviewProvider {
    static var previews: some View {
        LTekLogIn()
    }
}
