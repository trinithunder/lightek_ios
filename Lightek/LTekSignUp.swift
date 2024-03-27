//
//  LTekSignUp.swift
//  Lightek
//
//  Created by Marlon Henry on 3/19/24.
//

import SwiftUI

struct LTekSignUp: View {
    @Binding var isSignUpVisible:Bool
    @State var email = ""
    @State var password = ""
    @State var user = User()
    @EnvironmentObject var gk:Gate_Keeper
    @State var isTACVisible = false
    @State var isPrivacyPolVisible = false
    var body: some View {
        ScrollView{
            VStack{
                Spacer().frame(height:30)
                Group{
                    HStack{
                    Button{
                                                isSignUpVisible.toggle()
                                            }label:{
                                                Image(systemName: "arrow.left")
                                                    .foregroundColor(Color("AccentColor"))
                                                    .padding(.leading,10)
                                            }
                    Spacer()
                }}
                Text("Create an account")
                    .font(.largeTitle)
                Group{
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color("AccentColor"),lineWidth: 1)
                        .frame(width:UIScreen.main.bounds.width - 20,height: 44)
                        .overlay(
                            TextField("Email", text: $email)
                                .padding(.leading,10)
                        )
                    Spacer().frame(height:30)
                }
                Group{
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color("AccentColor"),lineWidth: 1)
                        .frame(width:UIScreen.main.bounds.width - 20,height: 44)
                        .overlay(
                            SecureField("Password", text: $password)
                                .padding(.leading,10)
                        )
                    Spacer().frame(height:30)
                }
                
                Group{
                    Button{
                        user.createUser(email: email, password: password, gk: gk) {
                            isSignUpVisible.toggle()
                        }
                }label:{
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color("AccentColor"))
                        .frame(width: UIScreen.main.bounds.width - 20, height: 58)
                        .overlay(Text("Create account")
                                    .foregroundColor(.white)
                        )
                }
                    
                }
                
                Group{
                        Text("By creating an account, you agree to LTek")
                    HStack{
                        Button{
                            isTACVisible.toggle()
                        }label:{
                            Text("Terms and Conditions")
                        }.fullScreenCover(isPresented: $isTACVisible, onDismiss: nil) {
                            LTekTACView()
                        }
                        Text("and")
                        Button{
                            isPrivacyPolVisible.toggle()
                        }label:{
                            Text("Privacy Policy")
                        }.fullScreenCover(isPresented: $isPrivacyPolVisible, onDismiss: nil) {
                            LTekPrivacyPolicyView()
                        }
                    }
                    
                }
                Group{
                    Spacer().frame(height:50)
                    HStack{
                        Text("Have an account?")
                        Button{
                            isSignUpVisible.toggle()
                        }label:{
                            Text("Log in")
                        }
                    }
                }
            }
        }
        
    }
}

struct LTekSignUp_Previews: PreviewProvider {
    static var previews: some View {
        LTekSignUp(isSignUpVisible: .constant(false))
    }
}
