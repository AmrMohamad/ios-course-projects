//
//  InfoView.swift
//  AmrCard-SwiftUI
//
//  Created by Amr Mohamad on 30/05/2023.
//

import SwiftUI

struct InfoView: View {
    let text: String
    let imageName: String
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(Color.white)
            .frame(height: 60)
            .overlay {
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(
                            Color(red: 0.09,
                                  green: 0.12,
                                  blue: 0.22)
                        )
                    Text(text)
                }
            }
            .padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "hello", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
