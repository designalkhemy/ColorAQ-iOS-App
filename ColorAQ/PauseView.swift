//
//  PauseView.swift
//  ColorAQ
//
//  Created by Jennifer on 2025-06-04.
//

import SwiftUI

struct PauseView: View {

    @Environment(\.dismiss) var dismiss

    @Binding var isActive: Bool
    @Binding var path: NavigationPath
    @Binding var restartGame: Bool

    var body: some View {

        VStack(spacing: 80) {

            Spacer()

            Text("Game Paused")
                .font(.largeTitle.bold())
                .foregroundStyle(.white)
                .padding(.bottom, 50)

            Button("RESUME") {
                isActive = true
                dismiss()
            }
            .buttonStyle(ButtonStyling(padding: 50))

            Button("END GAME") {
                restartGame = true
                path = NavigationPath()
            }
            .buttonStyle(ButtonStyling(padding: 35))

            Spacer()
            Spacer()
            Spacer()

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.bgColor)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    PauseView(isActive: .constant(false), path: .constant(NavigationPath()), restartGame: .constant(false))
}
