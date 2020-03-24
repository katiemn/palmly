//
//  ReadingRow.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/22/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct ReadingRow: View {
    
    var line: String
    var classification: String
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text(self.line)
                    .font(Font.custom("DMSans", size: 36))
                    .padding()
                Text(getReading(line: self.line, classification: self.classification))
                    .font(Font.custom("DMSans", size: 18))
                    .padding(.leading)
                    .padding(.trailing)
            }
            .frame(width: geometry.size.width,
                height: nil,
                alignment: .topLeading)
        }
    }
}

struct ReadingRow_Previews: PreviewProvider {
    static var previews: some View {
        ReadingRow(line: "Heart", classification: "long")
    }
}
