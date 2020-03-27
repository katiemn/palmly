//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Vincent Fitzgerald Tolliver on 3/21/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct ReadingViewController: View {
    var userReadings: [String]
    
    var body: some View {
        NavigationView {
            
                ZStack {
                    GeometryReader { geometry in
                        TopBarDivider(yOffset: 0, screenWidth: geometry.size.width)
            
                        VStack(alignment: .leading) {
                            ReadingRow(line: "Life", classification: self.userReadings[0])
                                        
                            ReadingRow(line: "Head", classification: self.userReadings[1])
                                
                            ReadingRow(line: "Heart", classification: self.userReadings[2])
                        }
                        .navigationBarTitle(Text("Your Reading"))
                    }
                }
            }
            .foregroundColor(.black)
        }
}

struct ReadingViewController_Previews: PreviewProvider {
    static var previews: some View {
        ReadingViewController(userReadings: ["short", "long, curved", "splits"])
    }
}

