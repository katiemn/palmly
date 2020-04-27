//
//  DetailsView.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/24/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct DetailsView: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var line = self.ViewRouter.lines[self.ViewRouter.currentLineIndex]
    
    var body: some View {
        VStack {
            Header(title: self.line, viewRouter: self.viewRouter)
            
            Spacer()
            
            Tabs(viewRouter: self.viewRouter)
                .padding()
            
            Spacer()
            
            if self.viewRouter.currentTab == 0 {
                Breakdown(viewRouter: self.viewRouter)
                .padding()
            }
//            } else if self.viewRouter.currentTab == 1 {
//                Personality(line: self.line, personalityObjects: self.personalityObjects)
//            } else {
//                Lifestyle(lifestyleTips: self.lifestyleTips)
//            }
                
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        Text("hey")
//        DetailsView(viewRouter: ViewRouter(), line: "Life",
//                    topReadings: testTopReadings,
//                    personalityObjects: testPersonalityObjects,
//                    lifestyleTips: testLifestyleTips)
    }
}
