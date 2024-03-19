//
//  LTekOnboardingView.swift
//  Lightek
//
//  Created by Marlon Henry on 3/17/24.
//

import SwiftUI

struct LTekOnboardingView: View {
    // Index to keep track of the current page
        @State private var currentPageIndex = 0
        
        // Data representing the pages
        @State var pages = ["Page 1", "Page 2", "Page 3"]
    var body: some View {
        VStack(spacing:10){
            // Page view
                        TabView(selection: $currentPageIndex) {
                            ForEach(0..<pages.count, id: \.self) { index in
                                Text(self.pages[index])
                                    .font(.title)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                        
                        // Page control
                        LTekPageControl(numberOfPages: pages.count, currentPageIndex: $currentPageIndex)
                            //.padding()
            Spacer()
            Button{
                
            } label:{
                Rectangle().frame(width: UIScreen.main.bounds.width - 20, height: 30)
                    .foregroundColor(.blue)
                    .cornerRadius(25)
                    .overlay(Text("Get started")
                                .foregroundColor(.white))
            }
            
            Button{
                
            }label:{
                Text("I have an account")
            }
            
            Spacer().frame(height:50)
            
        }
        
    }
}

struct LTekOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        LTekOnboardingView()
    }
}
