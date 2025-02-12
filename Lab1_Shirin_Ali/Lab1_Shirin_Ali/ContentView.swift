//
//  ContentView.swift
//  Lab1_Shirin_Ali
//
//  Created by Shirin Ali on 2025-02-12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Is this number prime?")
                .font(.largeTitle)
                .padding()
            
            Text("0")  // Placeholder for random number
                .font(.system(size: 80, weight: .bold))
                .padding()
            
            HStack {
                Button("Prime") {}
                    .font(.title)
                    .padding()
                    .frame(width: 120, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                
                Button("Not Prime") {}
                    .font(.title)
                    .padding()
                    .frame(width: 120, height: 50)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}
