//
//  CryptoTrackApp.swift
//  CryptoTrack
//
//  Created by Saiprasad lokhande on 25/02/24.
//

import SwiftUI

@main
struct CryptoTrackApp: App {
    @StateObject private var vm = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView().navigationBarHidden(true)
            }.environmentObject(vm)
        }
    }
}
