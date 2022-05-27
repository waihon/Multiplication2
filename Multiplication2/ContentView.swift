//
//  ContentView.swift
//  Multiplication2
//
//  Created by Waihon Yew on 28/05/2022.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        Text("Game")
            .padding()
    }
}

struct SettingsView: View {
    let callback: () -> Void

    var body: some View {
        Text("Settings")
            .padding()
        Button("Start Game") {
            callback()
        }
    }
}

struct ContentView: View {
    @State private var gameIsActive = false

    var body: some View {
        Text("Content")
            .padding()
        if gameIsActive {
            GameView()
        } else {
            SettingsView(callback: { gameIsActive = true })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
