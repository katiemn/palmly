//
//  Tabs.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/22/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct Tabs: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    if (self.viewRouter.currentTab < 2) {
                        self.viewRouter.currentTab += 1
                    }
                } else if $0.translation.width > 100 {
                    if (self.viewRouter.currentTab > 0) {
                        self.viewRouter.currentTab -= 1
                    }
                }
        }
        
        return HStack(spacing: 35) {
            Button(action: {
                self.viewRouter.currentTab = 0
            }) {
                Text("Breakdown")
                    .font((self.viewRouter.currentTab == 0) ? .title : .subheadline)
            }
            
            Button(action: {
                self.viewRouter.currentTab = 1
            }) {
                Text("Personality")
                .font((self.viewRouter.currentTab == 1) ? .title : .subheadline)
            }
            
            Button(action: {
                self.viewRouter.currentTab = 2
            }) {
                Text("Lifestyle")
                .font((self.viewRouter.currentTab == 2) ? .title : .subheadline)
            }
        }
        .foregroundColor(Color.black)
        .gesture(drag)
    }
}
    

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs(viewRouter: ViewRouter())
    }
}
