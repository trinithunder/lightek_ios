//
//  ContentView.swift
//  Lightek
//
//  Created by Marlon Henry on 3/17/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gk:Gate_Keeper
    var body: some View {
        GateKeeper().shangTsung().blur(radius: gk.showBlur ? 100:0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
