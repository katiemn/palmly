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
            VStack(alignment: .leading) {
                ReadingRow(line: "Life", classification: userReadings[0])
                        
                ReadingRow(line: "Head", classification: userReadings[1])
                
                ReadingRow(line: "Heart", classification: userReadings[2])
            }
            .navigationBarTitle(Text("Your Reading"))
        }
    }
}

struct ReadingViewController_Previews: PreviewProvider {
    static var previews: some View {
        ReadingViewController(userReadings: ["short", "long, curved", "splits"])
    }
}

