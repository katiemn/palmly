//
//  Tabs.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/22/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct Tabs: View {
    var body: some View {
        TabView {
            Breakdown()
                .tabItem {
                    Text("Breakdown")
                }
            
            Personality()
                .tabItem {
                    Text("Personality")
                }
            
            Lifestyle()
                .tabItem {
                    Text("Lifestyle")
                }
        }
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
