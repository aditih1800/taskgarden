//
//  TaskGardenApp.swift
//  TaskGarden
//
//  Created by Aditi Hariharan on 6/7/23.
//
import FirebaseCore
import SwiftUI

@main
struct TaskGardenApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView() //entry point for app
        }
    }
}
