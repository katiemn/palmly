//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Vincent Fitzgerald Tolliver on 3/21/20.
//  Copyright © 2020 Apple. All rights reserved.
//
import SwiftUI

struct ReadingView: View {
    @ObservedObject var viewRouter: ViewRouter
    
    @State var meanings: [String] = ["", "", ""]
    @State var imageBuffer: CVPixelBuffer?

    var body: some View {
        VStack(alignment: .leading) {
            Header(title: "Your Reading", viewRouter: self.viewRouter)
            
            if (self.viewRouter.readings.count > 0) {
                ForEach((0 ..< self.viewRouter.lines.count), id: \.self) { lineIndex in
                    VStack {
                    Button(action: { self.viewRouter.currentPage += 1; self.viewRouter.currentLineIndex = lineIndex}) {
                        ReadingRow(line: self.viewRouter.lines[lineIndex], meaning: self.meanings[lineIndex])
                    }
                    .foregroundColor(Color.black)
                    
                    Spacer()
                    }
                }
            }
        }
        .padding()
        .onAppear {
            self.imageBuffer = self.viewRouter.imageBuffer
            var heartModelDataHandler: ModelDataHandler? = ModelDataHandler(modelFileInfo: MobileNet.heartModelInfo, labelsFileInfo: MobileNet.heartLabelsInfo)
            var lifeModelDataHandler: ModelDataHandler? = ModelDataHandler(modelFileInfo: MobileNet.lifeModelInfo, labelsFileInfo: MobileNet.lifeLabelsInfo)
            var headModelDataHandler: ModelDataHandler? = ModelDataHandler(modelFileInfo: MobileNet.headModelInfo, labelsFileInfo: MobileNet.headLabelsInfo)
            
            self.viewRouter.results.append( lifeModelDataHandler?.runModel(onFrame: self.imageBuffer!) as! Result)
            self.viewRouter.results.append( headModelDataHandler?.runModel(onFrame: self.imageBuffer!) as! Result)
            self.viewRouter.results.append( heartModelDataHandler?.runModel(onFrame: self.imageBuffer!) as! Result)
            
            for i in 0 ..< self.viewRouter.lines.count {
                self.viewRouter.readings.append(self.viewRouter.results[i].inferences[0].label)
                self.meanings[i] = getReading(line: self.viewRouter.lines[i], classification: self.viewRouter.readings[i])
            }
        }
    }
}

struct ReadingView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingView(viewRouter: ViewRouter())
    }
}

