//
//  PhoneFarmApp.swift
//  PhoneFarm
//
//  Created by John McCreery on 11/8/22.
//

import SwiftUI

@main
struct PhoneFarmApp: App {
    @StateObject var farmManager = FarmManager()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(farmManager)
        }
    }
}
