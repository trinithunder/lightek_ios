//
//  LightekApp.swift
//  Lightek
//
//  Created by Marlon Henry on 3/17/24.
//

import SwiftUI

@main
struct LightekApp: App {
    let gateKeeper = Gate_Keeper()
    var body: some Scene {
        WindowGroup {
            LTekLogIn().environmentObject(gateKeeper)
        }
    }
}
