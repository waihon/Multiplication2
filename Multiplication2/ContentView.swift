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
    let callback: (Int, Int) -> Void

    var body: some View {
        Text("Settings")
            .padding()
        Button("Start Game") {
            callback(8, 20)
        }
    }
}

struct ContentView: View {
    @State private var gameIsActive = false
    @State private var tablesUpTo = 8
    @State private var questionCount = 10

    var body: some View {
        Text("Content")
            .padding()
        if gameIsActive {
            GameView()
        } else {
            SettingsView(callback: startGame)
        }
    }

    func startGame(tablesUpTo: Int, questionCount: Int) {
        self.tablesUpTo = tablesUpTo
        self.questionCount = questionCount
        print(tablesUpTo)
        print(questionCount)

        gameIsActive = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
