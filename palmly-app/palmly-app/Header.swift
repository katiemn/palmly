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
        VStack(alignment: .center) {
            Button(
                action: {
                    if self.viewRouter.currentPage > 0 {
                        self.viewRouter.currentPage -= 1
                    }
                })
            {
                Image("back arrow").resizable()
                    .foregroundColor(Color.black)
                    .frame(width: 30, height: 30)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Rectangle()
                .fill(Color.black)
                .frame(height: 5)

            Text(self.title)
                .font(.custom("ZillaSlab-SemiBold", size: 40))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)

        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(title: "Your Reading", viewRouter: ViewRouter())
    }
}
