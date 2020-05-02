//
//  DetailsView.swift
//  palmly-app
//
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct DetailsView: View {
    @ObservedObject var viewRouter: ViewRouter
        
    var body: some View {
        VStack {
            Header(title: self.viewRouter.lines[self.viewRouter.currentLineIndex], viewRouter: self.viewRouter)
            
            Spacer()
            
            Tabs(viewRouter: self.viewRouter)
                .padding(.bottom)
                .padding(.top)
            
            Spacer()
            
            if self.viewRouter.currentTab == 0 {
                Breakdown(viewRouter: self.viewRouter)
                    .padding(.bottom)
            } else if self.viewRouter.currentTab == 1 {
                Personality(viewRouter: self.viewRouter)
            } else {
                Lifestyle(viewRouter: self.viewRouter)
            }
                
        }
    .padding()
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
