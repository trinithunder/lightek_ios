//
//  LTekSignUp.swift
//  Lightek
//
//  Created by Marlon Henry on 3/19/24.
//

import SwiftUI

struct LTekSignUp: View {
    @Binding var isSignUpVisible:Bool
    @State var name = ""
    @State var email = ""
    @State var password = ""
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
                                                    .foregroundColor(.orange)
                                                    .padding(.leading,10)
                                            }
                    Spacer()
                }}
                Text("Create an account")
                    .font(.largeTitle)
                Group{
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.orange,lineWidth: 1)
                        .frame(width:UIScreen.main.bounds.width - 20,height: 44)
                        .overlay(
                            TextField("Name", text: $name)
                                .padding(.leading,10)
                        )
                    Spacer().frame(height:30)
                }
                Group{
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.orange,lineWidth: 1)
                        .frame(width:UIScreen.main.bounds.width - 20,height: 44)
                        .overlay(
                            TextField("Email", text: $email)
                                .padding(.leading,10)
                        )
                    Spacer().frame(height:30)
                }
                Group{
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.orange,lineWidth: 1)
                        .frame(width:UIScreen.main.bounds.width - 20,height: 44)
                        .overlay(
                            SecureField("Password", text: $password)
                                .padding(.leading,10)
                        )
                    Spacer().frame(height:30)
                }
                
                Group{
                        Text("By creating an account, you agree to LTek")
                    HStack{
                        Button{
                            
                        }label:{
                            Text("Terms and Conditions")
                        }
                        Text("and")
                        Button{
                            
                        }label:{
                            Text("Privacy Policy")
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
