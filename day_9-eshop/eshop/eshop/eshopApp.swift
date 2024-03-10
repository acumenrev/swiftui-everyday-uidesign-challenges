//
//  eshopApp.swift
//  eshop
//
//  Created by trivo on 03/03/2024.
//

import SwiftUI

@main
struct eshopApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}


struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }

            HomeView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}


#Preview {
    MainView()
}
