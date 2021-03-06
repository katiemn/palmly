//
//  Breakdown.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/22/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct Breakdown: View {
    var line: String
    var topReadings: [ProbableReading]
    
    var body: some View {
        VStack {
            ForEach(topReadings, id: \.id) {reading in
                BreakdownRow(line: self.line, classification: reading.meaning, percentage: reading.percentage)
            }
        }
    }
}

struct Breakdown_Previews: PreviewProvider {
    static var previews: some View {
        Breakdown(line: "Life", topReadings: testTopReadings)
    }
}
