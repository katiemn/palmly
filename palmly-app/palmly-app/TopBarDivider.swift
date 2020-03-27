//
//  TopBarDivider.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/22/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct TopBarDivider: View {
    var yOffset: CGFloat
    var screenWidth: CGFloat
    
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
            .fill(topDividerGrey)
                .frame(width: self.screenWidth - 20, height: 5)
                .offset(y: self.yOffset)
        }
    }
}

struct TopBarDivider_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            TopBarDivider(yOffset: 0, screenWidth: geometry.size.width-20)
        }
    }
}
