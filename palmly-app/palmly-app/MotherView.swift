//
//  MotherView.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/30/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct MotherView: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if (self.viewRouter.currentPage == 0) {
                TakePhoto(viewRouter: self.viewRouter)
            } else if (self.viewRouter.currentPage == 1) {
                ReadingView(viewRouter: self.viewRouter)
            } else {
                DetailsView(viewRouter: self.viewRouter)
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}
