//
//  Tabs.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/22/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct Tabs: View {
    @ObservedObject var viewRouter: ViewRouter;
    var selectedTabFontSize: CGFloat = 26;
    var tabFontSize: CGFloat = 20;
    
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
                    .font(.custom("ZillaSlab-SemiBold", size: self.viewRouter.currentTab == 0 ? self.selectedTabFontSize : self.tabFontSize))
            }
            
            Button(action: {
                self.viewRouter.currentTab = 1
            }) {
                Text("Personality")
                    .font(.custom("ZillaSlab-SemiBold", size: self.viewRouter.currentTab == 1 ? self.selectedTabFontSize : self.tabFontSize))
            }
            
            Button(action: {
                self.viewRouter.currentTab = 2
            }) {
                Text("Lifestyle")
                    .font(.custom("ZillaSlab-SemiBold", size: self.viewRouter.currentTab == 2 ? self.selectedTabFontSize : self.tabFontSize))
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
