//
//  ColorGameView.swift
//  ColorAQ
//
//  Created by Jennifer on 2025-06-03.
//

import SwiftUI
 
struct ColorGameView: View {

    let dimensionPerLevel = [2, 3, 4, 5, 5,
                 6, 6, 7, 7, 7,
                 8, 8, 8, 8, 8,
                 8, 9]

    @State private var dimension = 2

    @State private var timeRemaining = 60
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @State private var showPauseView = false
    @State private var showGameOverView = false

    @Binding var isActive: Bool
    @Binding var level: Int
    @Binding var path: NavigationPath

     var body: some View {
         
        VStack {

            ZStack {

                GeometryReader { proxy in

                    HStack {

                        Text("Level: \(level)")
                            .padding(.leading, 20)
                            .foregroundStyle(.white)
                            .font(.title3)

                        Spacer()

                        Text("\(timeRemaining)")
                            .padding(.horizontal, 20)
                            .padding(.vertical, 7)
                            .font(.title2.bold())
                            .foregroundStyle(timeRemaining > 5 ? .white : Color(red: 0.9, green: 0.35, blue: 0.28))
                            .background(timeRemaining > 5 ? Color(red: 0.95, green: 0.55, blue: 0.45) : .white)
                            .clipShape(.capsule)

                        Spacer()

                        Button("Pause") {
                            isActive = false
                            path.append("Pause")
                        }
                        .buttonStyle(ButtonStyling(padding: 7))
                        .padding(.trailing, 15)

                    }

                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(maxWidth: proxy.size.width, maxHeight: proxy.size.width)
                        .position(x: proxy.size.width / 2, y: proxy.size.height / 2)


                    SquaresView(dimension: dimension, score: $level)
                }


            }
            .background(Color.bgColor)

        }
        .onReceive(timer) { time in
            guard isActive else { return }
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                showGameOverView = true
                self.timer.upstream.connect().cancel()
            }
        }
        .onChange(of: level) {
            if level < 17 {
                dimension = dimensionPerLevel[level - 1]
            } else {
                dimension = dimensionPerLevel[16]
            }
            if level != 1 {
                isActive = true
            }
        }
        .onChange(of: showGameOverView) {
            path.append("GameOver")
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ColorGameView(isActive: .constant(false), level: .constant(1), path: .constant(NavigationPath()))
}
