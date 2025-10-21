//
//  SquaresView.swift
//  ColorAQ
//
//  Created by Jennifer on 2025-06-03.
//

import SwiftUI

struct SquaresView: View {

    var dimension: Int
    @Binding var score: Int

    @State private var randomX = Int.random(in: 1...2)
    @State private var randomY = Int.random(in: 1...2)

    @State private var colorR = Double.random(in: 0...1)
    @State private var colorG = Double.random(in: 0...1)
    @State private var colorB = Double.random(in: 0...1)

    var opacity: Double {
        switch dimension {
        case 2:
            0.5
        case 3:
            0.6
        case 4:
            0.65
        case 5:
            0.7
        case 6:
            0.75
        case 7:
            0.8
        case 8:
            0.85
        default:
            0.9
        }
    }


    var body: some View {

        GeometryReader { proxy in

            Grid {

                ForEach(1..<dimension + 1, id: \.self) { x in

                    GridRow {

                        HStack {

                            ForEach(1..<dimension + 1, id: \.self) { y in

                                Button {
                                   randomNumber()
                                    randomColor()
                                    score += 1
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(randomX == x && randomY == y ? Color(red: colorR, green: colorG, blue: colorB).opacity(opacity) : Color(red: colorR, green: colorG, blue: colorB))
                                }
                                .disabled(randomX != x || randomY != y)

                            }

                        }

                    }
                }

            }
            .padding(10)
            .frame(maxWidth: proxy.size.width, maxHeight: proxy.size.width)
            .position(x: proxy.size.width / 2, y: proxy.size.height / 2)

        }
        //Text("\(randomX) x \(randomY)")

    }

    func randomColor() {
        colorR = Double.random(in: 0.05..<1)
        colorB = Double.random(in: 0.05..<1)
        colorG = Double.random(in: 0.05..<1)
    }

    func randomNumber() {
        randomX = Int.random(in: 1...(dimension))
        randomY = Int.random(in: 1...(dimension))
    }

}

#Preview {
    SquaresView(dimension: 2, score: .constant(2))
}
