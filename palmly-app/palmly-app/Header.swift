//
//  Header.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/29/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct Header: View {
    
    var title: String
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                if self.viewRouter.currentPage > 0 {
                    self.viewRouter.currentPage -= 1
                }
                }) {
                Image("left arrow")
                    .foregroundColor(Color.black)
            }
            Rectangle()
                .fill(Color.black)
                .frame(width: 380, height: 5)

            Text(self.title)
                .font(.custom("ZillaSlab-SemiBold", size: 48))

            Rectangle()
            .fill(Color.white)
            .frame(width: 380, height: 10)

            Rectangle()
            .fill(topDividerGrey)
            .frame(width: 380, height: 2)
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(title: "Your Reading", viewRouter: ViewRouter())
    }
}
