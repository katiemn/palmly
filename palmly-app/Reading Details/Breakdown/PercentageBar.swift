//
//  BreakdownPercentageBar.swift
//  palmly-app
//
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct PercentageBar: View {
    var percentage: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader{ geometry in
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: ((geometry.size.width - 20) * self.percentage), height: 15)
                    Rectangle()
                        .fill(Color.white)
                    .frame(width: (geometry.size.width - 20) * (1 - self.percentage), height: 15)
                }
            }
        }
    }
}

struct PercentageBar_Previews: PreviewProvider {
    static var previews: some View {
        PercentageBar(percentage: 0.07)
    }
}
