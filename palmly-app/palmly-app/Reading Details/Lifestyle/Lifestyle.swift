//
//  Lifestyle.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/22/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

var selectedCircleTabColor = Color(red: 0.717, green: 0.706, blue: 0.706)
var circleTabColor = Color(red: 0.898, green: 0.898, blue: 0.898)

struct Lifestyle: View {
    @State private var selected = 0
    @State private var offset: CGSize = .zero
    
    var lifestyleTips: [String]
    
    func changeTab(tabIndex: Int) {
        if (tabIndex >= 0 && tabIndex < self.lifestyleTips.count) {
            selected = tabIndex
        }
    }
    
    var body: some View {
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    self.changeTab(tabIndex: self.selected+1)
                } else if $0.translation.width > 100 {
                    self.changeTab(tabIndex: self.selected-1)
                }
        }
        
        return GeometryReader { geometry in
            VStack() {

                Text(self.lifestyleTips[self.selected])
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: geometry.size.width * 0.8)
                    .font(.custom("DMSans-Regular", size: 24))
                    .padding(geometry.size.width * 0.1)
                    
                
                Spacer()
                                
                HStack(alignment: .center, spacing: (geometry.size.width * 0.4 / CGFloat(self.lifestyleTips.count))) {
                    ForEach(0 ..< self.lifestyleTips.count) { index in
                        Button (action: {self.changeTab(tabIndex: index)})
                        {
                            Circle()
                            .fill((index == self.selected) ? selectedCircleTabColor : circleTabColor)
                            .frame(width: 20, height: 20)
                        }
                    }
                }
                .frame(width: geometry.size.width * 0.8)
                .offset(y: -50)
            }
            .gesture(drag)
        }
    }
}

struct Lifestyle_Previews: PreviewProvider {
    static var previews: some View {
        Lifestyle(lifestyleTips: testLifestyleTips)
    }
}
