//
//  ContentView.swift
//  app_settings
//
//  Created by trivo on 25/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isExpandedSectionII = true
    @State private var age: Int = 18
    @State private var colors: [String] = ["Red", "Green", "Blue"]
    @State private var color: String = "Red"
    @State private var showInfo: Bool = false
    let range: ClosedRange<Int> = 18...99
    @State private var showTerms: Bool = false
    var body: some View {
        NavigationView {
            mainContent
                .navigationTitle("Settings")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button("About") {
                            print("About tapped!")
                        }
                        Button("Help") {
                            print("Help tapped!")
                        }
                    }
                    ToolbarItemGroup(placement: .secondaryAction) {
                        Button("Settings") {
                            print("Settings tapped")
                        }
                        Button("Email Me") {
                            print("Email tapped")
                        }
                    }
                }
        }

    }

    private var mainContent: some View {
        Form {
            Section("Section I") {
                Group {
                    RowWithToggle(title: "Dark Mode")
                    RowWithToggle(title: "Fullscrene background")
                }

            }
            Section("Section II", isExpanded: $isExpandedSectionII) {
                Stepper(value: $age, in: range) {
                    Text("Age \(age)")
                }

                Picker("Avatar Color", selection: $color) {
                    ForEach(colors, id: \.self) { color in
                        Text(color).tag(color)
                    }
                }
                .pickerStyle(.menu)

                Toggle(isOn: $showInfo) {
                    Text("Display my full info")
                }
            }
            Section("Terms & Conditions") {
                    Button("Read terms & conditions") {
                        showTerms = true
                    }
                }
        }
        .sheet(isPresented: $showTerms) {
            Text("Terms and conditions text")
        }
    }
}

#Preview {
    ContentView()
}
