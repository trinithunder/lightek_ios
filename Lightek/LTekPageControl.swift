//
//  LTekPageControl.swift
//  Lightek
//
//  Created by Marlon Henry on 3/18/24.
//

import SwiftUI

struct LTekPageControl: View {
    var numberOfPages: Int
    @Binding var currentPageIndex: Int
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfPages) { index in
                Circle()
                    .fill(index == currentPageIndex ? Color.blue : Color.gray)
                    .frame(width: 10, height: 10)
                    .padding(5)
            }
        }
    }
}

