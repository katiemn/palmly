//
//  TabUnderline.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/23/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct TabUnderline: View {
    var body: some View {
        GeometryReader{ geometry in
            Rectangle()
                .fill(topDividerGrey)
                .frame(width: geometry.size.width - 20, height: 5)
                .offset(y: -350)

        }
    }
}

struct TabUnderline_Previews: PreviewProvider {
    static var previews: some View {
        TabUnderline()
    }
}
