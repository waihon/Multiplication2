//
//  ContentView.swift
//  Multiplication2
//
//  Created by Waihon Yew on 28/05/2022.
//

import SwiftUI

struct Question {
    var text: String
    var answer: Int
}

struct GameView: View {
    var body: some View {
        Text("Game")
            .padding()
    }
}

struct SettingsView: View {
    let callback: (Int, Int) -> Void
    @State private var tablesUpTo = 8
    @State private var questionCount = 10

    var body: some View {
        NavigationView {
            Form {
                Section("Multiplication Tables") {
                    Stepper("Up to \(tablesUpTo)", value: $tablesUpTo, in: 2...12)
                }

                Section("How Many Questions?") {
                    TextField("Number of questions:", value: $questionCount, format: .number)
                        .keyboardType(.numberPad)
                }
                HStack {
                    Spacer()
                    Button("Start Game") {
                        callback(tablesUpTo, questionCount)
                    }
                    Spacer()
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct ContentView: View {
    @State private var gameIsActive = false
    @State private var tablesUpTo = 8
    @State private var questionCount = 10
    @State private var questions = [Question]()

    var body: some View {
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

        generateQuestions()

        gameIsActive = true
    }

    func generateQuestions() {
        questions.removeAll()

        for i in 0..<questionCount {
            let number = Array(1...12).randomElement()!
            let multiplier = Array(2...tablesUpTo).randomElement()!
            let text = "What is \(number) x \(multiplier)?"
            let answer = number * multiplier

            questions.append(Question(text: text, answer: answer))
            print(questions[i])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
