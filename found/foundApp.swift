//
//  foundApp.swift
//  found
//
//  Created by Can Sanchez on 2024-02-28.
//

import SwiftUI

@main
struct foundApp: App {
    var network = Network()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
        }
    }
}
