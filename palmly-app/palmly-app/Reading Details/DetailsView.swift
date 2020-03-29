//
//  DetailsView.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/24/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

var globalCurrentTab = "Breakdown"

struct DetailsView: View {
    var line: String
    var topReadings: [ProbableReading]
    var personalityObjects: [PersonalityObject]
    var lifestyleTips: [String]
    
    @State private var currentTab = globalCurrentTab

    var body: some View {
        VStack {
            GeometryReader { geometry in
                TopBarDivider(yOffset: 0, screenWidth: geometry.size.width)
            
                ZStack {
                    if globalCurrentTab == "Breakdown" {
                        Breakdown(line: self.line, topReadings: self.topReadings)
                    } else if globalCurrentTab == "Personality" {
                        Personality(line: self.line, personalityObjects: self.personalityObjects)
                    } else {
                        Lifestyle(lifestyleTips: self.lifestyleTips)
                    }
                    
                }
                
                Spacer()
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(line: "Life",
                    topReadings: testTopReadings,
                    personalityObjects: testPersonalityObjects,
                    lifestyleTips: testLifestyleTips)
    }
}
