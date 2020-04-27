//
//  Breakdown.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/22/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct Breakdown: View {
    @ObservedObject var viewRouter: ViewRouter
        
    var body: some View {
        let line: String = self.viewRouter.lines[self.viewRouter.currentLineIndex]
        let inferences: [Inference] = self.viewRouter.results[self.viewRouter.currentLineIndex].inferences

        return VStack {
            ForEach((0 ..< inferences.count), id: \.self) {index in
                BreakdownRow(meaning: getReading(line: line, classification: inferences[index].label), probability: inferences[index].confidence < 0.005 ? 0.01 :  CGFloat(inferences[index].confidence))
            }
        }
    }

}

struct Breakdown_Previews: PreviewProvider {
    static var previews: some View {
        Text("hey there")
//        Breakdown(line: "Life", topReadings: testTopReadings)
    }
}
