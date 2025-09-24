//
//  File.swift
//
//
//  Created by Jackson Harper on 12/7/22.
//

import Foundation
import SwiftUI

public struct FeaturePrimer: View {
  let isBeta: Bool
  let title: String
  let message: String
  @Environment(\.dismiss) private var dismiss

  public var body: some View {
    VStack(spacing: 0) {
      VStack(alignment: .leading) {
        Text(title)
          .font(.textToSpeechRead)
          .foregroundColor(Color.appGrayTextContrast)
          .frame(maxWidth: .infinity, alignment: .leading)

        if isBeta {
          HStack {
            TextChip(text: "¡ Beta !", color: Color.red)
              .frame(alignment: .leading)
            TextChip(text: "¡ New Feature !", color: Color.green)
              .frame(alignment: .leading)
          }
        }
      }

      ScrollView {
        let parsedMessage = try? AttributedString(markdown: message,
                                                  options: .init(interpretedSyntax: .inlineOnlyPreservingWhitespace))
        Text(parsedMessage ?? "")
          .foregroundColor(Color.appGrayText)
          .accentColor(.blue)
          .padding(.bottom, 16)
      }
      .padding(.top, 16)

      Spacer()

      Button(action: {
        dismiss()
      }, label: { Text(LocalText.dismissButton) })
        .buttonStyle(PlainButtonStyle())
    }.padding()
  }

  public static var recommendationsPrimer: some View {
    FeaturePrimer(
      isBeta: true,
      title: "Introducing Clubs",
      message: """
      Clubs make it easy to share great reads with friends and co-workers.

      To get started, create a club from the profile page and invite some friends.

      *During the beta you can create a max of three clubs. Club sizes are limited to 12 people.*

      [Learn more about clubs](https://blog.omnivore.work/p/dca38ba4-8a74-42cc-90ca-d5ffa5d075cc)

      """
    )
  }
}
