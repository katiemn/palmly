//
//  BreakdownRow.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/23/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct BreakdownRow: View {
    var line: String
    var classification: String
    var percentage: CGFloat
    
    
    var body: some View {
        ZStack {
            PercentageBar(percentage: self.percentage)
                .offset(y: -55)
            
            HStack {
                Text("\(Int(percentage * 100))%")
                    .font(.custom("ZillaSlab-SemiBold", size: 30))
                    .padding(.trailing)
                
                Text(getReading(line: self.line, classification: self.classification))
                    .font(.custom("DMSans-Regular", size: 18))
            }
            .padding(.leading)
            .padding(.trailing)
        }
    }
}

struct BreakdownRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
             BreakdownRow(line: "Head", classification: "splits", percentage: 0.8)
            
             BreakdownRow(line: "Heart", classification: "short, straight", percentage: 0.08)
        }
    }
}
