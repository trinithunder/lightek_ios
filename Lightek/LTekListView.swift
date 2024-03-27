//
//  LTekListView.swift
//  Lightek
//
//  Created by Marlon Henry on 3/17/24.
//

import SwiftUI

struct LTekListView: View {
    @State var url: URL = URL(string: "http://google.com")!
    @State var placeholderColor: Color = .blue
    @State var borderWidth: CGFloat = 0.3
    @State var items:[User] = [User(displayName: "Havic", screenName: "@haveyec", userImage: "https://wallpapercave.com/wp/wp3324196.jpg")]
    @State var workFlow:[Int] = [1,2,3,4,5,6,7,8]
    var body: some View {
        List{
            ForEach(items, id:\.self){ item in
                Button {
                    //
                } label: {
                    HStack{
                        AsyncImage(url: URL(string: item.userImage!)) { image in
                            image
                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 50, height: 50)
                                                .clipShape(Circle())
                                                .overlay(Circle().strokeBorder(Color.white, lineWidth: borderWidth))
                        } placeholder: {
                            ProgressView()
                        }
                        .padding(.trailing,30)


                        VStack{
                            Text(item.displayName!)
                            Text(item.screenName!)
                        }
                        Spacer()
                        Image(systemName: "chevron.right.circle")
                            .font(.system(size: 10))
                            .foregroundColor(.black)
                    }
                    .foregroundColor(.black)
                    .shadow(color: Color.white.opacity(0.5), radius: 3, x: 0, y: 3)
                }
            }

        }
    }
}

struct LTekListView_Previews: PreviewProvider {
    static var previews: some View {
        LTekListView()
    }
}
