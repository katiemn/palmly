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
    var meaning: String
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.line)
                .font(Font.custom("DMSans", size: 36))
                .padding()
            Text(self.meaning)
                .font(Font.custom("DMSans", size: 18))
                .fixedSize(horizontal: false, vertical: true)
                .padding(.leading)
                .padding(.trailing)
        }
        .frame(alignment: .topLeading)
        .padding(.bottom)
    }
}

struct ReadingRow_Previews: PreviewProvider {
    static var previews: some View {
        ReadingRow(line: "Heart", meaning: "sldkfjsldkf sldkfjsdkf ekjef lefflkewjf efjefklwfkje felkfjwek. welfkjwlfkjew ejfkefje felfkjefe ek")
    }
}
