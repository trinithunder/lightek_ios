//
//  LTekListItem.swift
//  Lightek
//
//  Created by Marlon Henry on 3/17/24.
//

import SwiftUI

struct LTekListItem: View {
    @State var cellForeGroundColor:Color = .blue
    var body: some View {
        VStack{
            Rectangle()
                .frame(width: UIScreen.main.bounds.width - 20,height:50)
                .foregroundColor(cellForeGroundColor)
                .overlay(
                    HStack{
                        Text("Image of user here")
                                    .foregroundColor(.white)
                                    .padding(.leading,10)
                                    .frame(width: 20, height: 20)
                                    .padding(.trailing,20)
                        VStack{
                            Text("Display name")
                            Text("@name")
                        }
                        Spacer()
                    }
                )
        }
    }
}

struct LTekListItem_Previews: PreviewProvider {
    static var previews: some View {
        LTekListItem()
    }
}
