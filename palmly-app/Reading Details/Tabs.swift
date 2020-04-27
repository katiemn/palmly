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
    
    var tabs = ["Breakdown", "Personality", "Lifestyle"]
    
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
        
        return HStack(spacing: 15) {
            ForEach((0 ..< self.tabs.count), id: \.self) { index in
                Button(action: {
                    self.viewRouter.currentTab = index
                }) {
                    Text(self.tabs[index])
                        .font(.custom("ZillaSlab-SemiBold", size: self.viewRouter.currentTab == index ? self.selectedTabFontSize : self.tabFontSize))
                }
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
