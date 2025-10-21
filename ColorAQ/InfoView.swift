//
//  InfoView.swift
//  ColorAQ
//
//  Created by Jennifer on 2025-06-05.
//

import SwiftUI

struct InfoView: View {

    var body: some View {

        VStack {

            Text("Info")
                .font(.largeTitle.bold())
                .padding(.bottom, 50)

            VStack(alignment: .leading, spacing: 30) {
                Text("1 - 16 Eye Problems")
                Text("17 - 21 There are some problems")
                Text("22 - 31 Good")
                Text("32 - 36 Pretty Good")
                Text("37 - 41 Very Good")
                Text("42 and above Super Good")
                Text("More than 25 points is awesome.")
                Text("Don't use your mobile phone if you score less than 16 points!")
            }
            .font(.title2)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(50)
        .background(Color.bgColor)
        .foregroundStyle(Color.white)
    }
}

#Preview {
    InfoView()
}
