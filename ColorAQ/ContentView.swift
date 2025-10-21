//
//  ContentView.swift
//  ColorAQ
//
//  Created by Jennifer on 2025-06-03.
//

import SwiftUI
 
struct ContentView: View {
    
    @State private var isShowingInfo = false
    
    @State private var path = NavigationPath()
    
    @State private var isActive = false
    @State private var level = 1
    
    @State private var restartGame = false
    
    var body: some View {
       
        NavigationStack(path: $path) {
            VStack(spacing: 50) {
                Spacer()
                
                Text("Color AQ")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                Text("Test your color accuracy!")
                    .font(.title)
                    .foregroundStyle(.white)
                
                Spacer()
                
                Button("Play") {
                    path.append("ColorGame")
                }
                .buttonStyle(ButtonStyling(padding: 50))
                
                Spacer()
                Spacer()
                Spacer()
            }
            .navigationDestination(for: String.self) { destination in
                if destination == "ColorGame" {
                    ColorGameView(isActive: $isActive, level: $level, path: $path)
                } else if destination == "Pause" {
                    PauseView(isActive: $isActive, path: $path, restartGame: $restartGame)
                } else if destination == "GameOver" {
                    GameOverView(level: $level, path: $path, restartGame: $restartGame)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.bgColor)
            .toolbar{
                Button {
                    isShowingInfo = true
                } label: {
                    Image(systemName: "info.circle")
                        .foregroundStyle(Color.bgColor)
                        .background(.white)
                        .clipShape(.circle)
                }
            }
            .sheet(isPresented: $isShowingInfo) {
                InfoView()
            }
            .onChange(of: restartGame) {
                level = 1
                restartGame = false
                isActive = false
            }
        }
        
    }
    
}

#Preview {
    ContentView()
}
