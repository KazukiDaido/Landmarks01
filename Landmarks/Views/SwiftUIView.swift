//
//  SwiftUIView.swift
//  Landmarks
//
//  Created by 大道一輝 on 2023/02/05.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    @State var ヨシヒコのHP: String = "100"
    var body: some View {
        HStack {
            VStack {
                Text("ヨシヒコのHP")
                Text(ヨシヒコのHP)
                    .padding(.vertical, 5)
            }
            VStack {
                Text("$ヨシヒコのHP")
                TextField("HP", text: $ヨシヒコのHP)
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: -5, y: -5)
                    .frame(width: 100)
            }
            .padding()
        }
    }
}
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
