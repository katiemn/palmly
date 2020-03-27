//
//  DetailsView.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/24/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

var globalCurrentTab = "Breakdown"

struct ProbableReading {
    var id: Int
    var meaning: String
    var percentage: CGFloat
    
}

struct DetailsView: View {
    var line: String
    var topReadings: [ProbableReading]
    @State private var currentTab = globalCurrentTab

    var body: some View {
        VStack {
            GeometryReader { geometry in
                TopBarDivider(yOffset: 0, screenWidth: geometry.size.width)
            
                ZStack {
                    if globalCurrentTab == "Breakdown" {
                        Breakdown(line: self.line, topReadings: self.topReadings)
                    } else if globalCurrentTab == "Personality" {
                        Personality()
                    } else {
                        Lifestyle()
                    }
                    
                }
                
                Spacer()
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(line: "Life", topReadings: [
            ProbableReading(id: 1, meaning: "short", percentage: CGFloat(0.8)),
            ProbableReading(id: 2, meaning: "long", percentage: CGFloat(0.13)),
            ProbableReading(id: 3, meaning: "faint", percentage: CGFloat(0.07))
        ])
    }
}
