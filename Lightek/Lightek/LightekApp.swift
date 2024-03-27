//
//  LightekApp.swift
//  Lightek
//
//  Created by Marlon Henry on 3/17/24.
//

import SwiftUI

@main
struct LightekApp: App {
    @StateObject var gateKeeper = Gate_Keeper()
    @Environment(\.scenePhase) var phase
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(gateKeeper).onChange(of: phase) { newPhase in
                switch newPhase {
                case .active:
                    print("Active")
                    gateKeeper.isActive = true
                case .background:
                    print("Background")
                   
                case .inactive:
                    print("InActive")
                    gateKeeper.isActive.toggle()
                @unknown default:
                    print("Unknown")
                }
                gateKeeper.showBlur = !gateKeeper.isActive
            }
        }
    }
}
