//
//  BreakdownRow.swift
//  palmly-app
//
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct BreakdownRow: View {
    var meaning: String
    var probability: CGFloat
    
    
    var body: some View {
        VStack {
            PercentageBar(percentage: self.probability)
            
            HStack {
                Text("\(Int(probability * 100))%")
                    .font(.custom("ZillaSlab-SemiBold", size: 30))
                    .padding(.trailing)
                
                Text(self.meaning)
                    .font(.custom("DMSans-Regular", size: 18))
                .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.leading)
            .padding(.trailing)
        }
    }
}

struct BreakdownRow_Previews: PreviewProvider {
    static var previews: some View {
        BreakdownRow(meaning: "You may need to chill out now and then. Yoga, meditation, walking, or taking time to play could do you good.", probability: 0.98)
    }
}
