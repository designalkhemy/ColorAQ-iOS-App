//
//  GameOverView.swift
//  ColorAQ
//
//  Created by Jennifer on 2025-06-04.
//

import SwiftUI

struct GameOverView: View {

    @Binding var level: Int
    @Binding var path: NavigationPath
    @Binding var restartGame: Bool

    var section: String {
        switch level {
        case 1...16:
            "Eye problems"
        case 17...21:
            "There are some problems"
        case 22...31:
            "Good"
        case 32...36:
            "Pretty good"
        case 37...41:
            "Very good"
        default:
            "Super Good"
        }
    }

    var body: some View {

        VStack(spacing: 40) {

            Spacer()

            Text("Level \(level)")
                .font(.largeTitle.bold())
                .foregroundStyle(.white)

            Text(section)
                .font(.title)
                .foregroundStyle(.white)
                .padding(.bottom, 80)

            Button("PLAY AGAIN") {
                restartGame = true
                path = NavigationPath()
            }
            .buttonStyle(ButtonStyling(padding: 30))

            Spacer()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.bgColor)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GameOverView(level: .constant(1), path: .constant(NavigationPath()), restartGame: .constant(false))
}
