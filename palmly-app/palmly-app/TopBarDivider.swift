//
//  TopBarDivider.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/22/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct TopBarDivider: View {
    var body: some View {
        GeometryReader{ geometry in
            Rectangle()
                .fill(topDividerGrey)
                .frame(width: geometry.size.width - 20, height: 5)
                .offset(y: -350)

        }
    }
}

struct TopBarDivider_Previews: PreviewProvider {
    static var previews: some View {
        TopBarDivider()
    }
}
