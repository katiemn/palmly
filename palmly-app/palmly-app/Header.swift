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
        VStack(alignment: .leading, spacing: 10) {
            Button(
                action: {
                    if self.viewRouter.currentPage > 0 {
                        self.viewRouter.currentPage -= 1
                    }
                })
            {
                HStack {
                    Image("back arrow").resizable()
                        .frame(width: 30, height: 30)
                    
                    Text(self.title)
                    .font(.custom("ZillaSlab-SemiBold", size: 35))
                    .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                }
                .foregroundColor(Color.black)

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Rectangle()
                .fill(Color.black)
                .frame(height: 5)
        }
        .padding(.top)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(title: "Your Reading", viewRouter: ViewRouter())
    }
}
