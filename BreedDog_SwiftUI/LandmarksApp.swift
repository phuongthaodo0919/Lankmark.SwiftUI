//
//  BreedDog_SwiftUIApp.swift
//  BreedDog_SwiftUI
//
//  Created by Salmdo on 3/30/23.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
