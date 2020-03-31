//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Vincent Fitzgerald Tolliver on 3/21/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct ReadingViewController: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var userReadings: [String]
    
    var body: some View {
            VStack {
                Header(title: "Your Reading", viewRouter: self.viewRouter)
                
                GeometryReader { geometry in
        
                    VStack(alignment: .leading) {
                        Button(action: { self.viewRouter.currentPage += 1}) {
                        ReadingRow(line: "Life", classification: self.userReadings[0])
                        }
                        
                        Button(action: { self.viewRouter.currentPage += 1}) {
                        ReadingRow(line: "Head", classification: self.userReadings[1])
                        }
                        
                        Button(action: { self.viewRouter.currentPage += 1}) {
                        ReadingRow(line: "Heart", classification: self.userReadings[2])
                        }
                    }
                    .navigationBarTitle(Text("Your Reading"))
                .navigationBarBackButtonHidden(true)
                }
            }
        .foregroundColor(.black)
        }
}

struct ReadingViewController_Previews: PreviewProvider {
    static var previews: some View {
        ReadingViewController(viewRouter: ViewRouter(), userReadings: ["short", "long, curved", "splits"])
    }
}

