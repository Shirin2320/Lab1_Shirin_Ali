//
//  ContentView.swift
//  Lab1_Shirin_Ali
//
//  Created by Shirin Ali on 2025-02-12.
//

import SwiftUI

struct ContentView: View {
    @State private var randomNumber: Int = Int.random(in: 1...100)
    @State private var isCorrect: Bool? = nil
    @State private var correctCount: Int = 0
    @State private var wrongCount: Int = 0
    @State private var attempts: Int = 0
    @State private var showAlert: Bool = false
    @State private var timer: Timer? = nil
    
    var body: some View {
        VStack {
            Text("Is this number prime?")
                .font(.largeTitle)
                .padding()
            
            Text("\(randomNumber)")
                .font(.system(size: 80, weight: .bold))
                .padding()
            
            HStack {
                Button(action: {
                    checkAnswer(isPrimeSelected: true)
                }) {
                    Text("Prime")
                        .font(.title)
                        .padding()
                        .frame(width: 120, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    checkAnswer(isPrimeSelected: false)
                }) {
                    Text("Not Prime")
                        .font(.title)
                        .padding()
                        .frame(width: 120, height: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            
            if let correct = isCorrect {
                Text(correct ? "✅" : "❌")
                    .font(.system(size: 80))
                    .padding()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Results"),
                message: Text("Correct: \(correctCount)\nWrong: \(wrongCount)"),
                dismissButton: .default(Text("OK")) {
                    resetGame()
                }
            )
        }
        .onAppear {
            startTimer()
        }
    }
    func checkAnswer(isPrimeSelected: Bool) {
        let primeStatus = isPrime(randomNumber)
        isCorrect = (primeStatus == isPrimeSelected)
        
        if isCorrect! {
            correctCount += 1
        } else {
            wrongCount += 1
        }
        
        attempts += 1
        if attempts >= 10 {
            showAlert = true
            stopTimer()
        } else {
            randomNumber = Int.random(in: 1...100)
            restartTimer()
        }
    }
    
        
