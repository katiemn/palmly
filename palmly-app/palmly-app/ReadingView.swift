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
    
    var heartModelDataHandler: ModelDataHandler? = ModelDataHandler(modelFileInfo: MobileNet.heartModelInfo, labelsFileInfo: MobileNet.heartLabelsInfo)
    var lifeModelDataHandler: ModelDataHandler? = ModelDataHandler(modelFileInfo: MobileNet.lifeModelInfo, labelsFileInfo: MobileNet.lifeLabelsInfo)
    var headModelDataHandler: ModelDataHandler? = ModelDataHandler(modelFileInfo: MobileNet.headModelInfo, labelsFileInfo: MobileNet.headLabelsInfo)
    
    @State var meanings: [String] = ["", "", ""]
    
    
    var body: some View {
        VStack {
            Header(title: "Your Reading", viewRouter: self.viewRouter)
            Spacer()
            
            if (self.viewRouter.readings.count > 0) {
                    VStack(alignment: .leading) {
                        ForEach((0 ..< self.viewRouter.lines.count), id: \.self) { lineIndex in
                            Button(action: { self.viewRouter.currentPage += 1; self.viewRouter.currentLineIndex = lineIndex}) {
                                ReadingRow(line: self.viewRouter.lines[lineIndex], meaning: self.meanings[lineIndex])
                            }
                            .foregroundColor(Color.black)
                        }
                    }
                    .navigationBarTitle(Text("Your Reading"))
                    .navigationBarBackButtonHidden(true)
            } else {
                Text("hey there")
            }
        }
        .padding()
        .onAppear {
            self.viewRouter.results.append( self.lifeModelDataHandler?.runModel(onFrame: self.viewRouter.imageBuffer!) as! Result)
            self.viewRouter.results.append( self.headModelDataHandler?.runModel(onFrame: self.viewRouter.imageBuffer!) as! Result)
            self.viewRouter.results.append( self.heartModelDataHandler?.runModel(onFrame: self.viewRouter.imageBuffer!) as! Result)
            
            for i in 0 ..< self.viewRouter.lines.count {
                self.viewRouter.readings.append(self.viewRouter.results[i].inferences[i].label)
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

