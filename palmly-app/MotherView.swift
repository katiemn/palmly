//
//  MotherView.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/30/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct MotherView: View {
    
    @ObservedObject var viewRouter = ViewRouter()
    
    var body: some View {
        VStack {
            if (self.viewRouter.currentPage == 0) {
                TakePhoto(viewRouter: self.viewRouter)
            } else if (self.viewRouter.currentPage == 1) {
                ReadingViewController(viewRouter: self.viewRouter, userReadings: ["short", "long, curved", "splits"])
            } else {
                DetailsView(viewRouter: self.viewRouter, line: "Life",
                topReadings: testTopReadings,
                personalityObjects: testPersonalityObjects,
                lifestyleTips: testLifestyleTips)
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView()
    }
}
