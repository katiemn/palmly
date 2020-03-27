//
//  Tabs.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/22/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct Tabs: View {
    @State var currentTab = globalCurrentTab
    
    var body: some View {
                
        HStack {
            Button(action: {
                self.switchTab(tab: "Breakdown")
            }) {
                Text("Breakdown")
                    .font(self.tabFont(tab: "Breakdown"))
            }
            Button(action: {
                self.switchTab(tab: "Personality")
            }) {
                Text("Personality")
                .font(self.tabFont(tab: "Personality"))
            }
            Button(action: {
                self.switchTab(tab: "Lifestyle")
            }) {
                Text("Lifestyle")
                .font(self.tabFont(tab: "Lifestyle"))
            }
        }
        .foregroundColor(Color.black)
    }
    
    func switchTab(tab: String) {
        globalCurrentTab = tab
        currentTab = tab
    }
    
    func tabFont(tab: String) -> Font {
        if (currentTab == tab) {
            return Font.custom("ZillaSlab", size: 30)
        }
        return Font.custom("ZillaSlab", size: 24)
    }
}
    

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs(currentTab: "Breakdown")
    }
}
