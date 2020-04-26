//
//  Personality.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/22/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct Personality: View {
    
    var line: String
    var personalityObjects: [PersonalityObject]
    @State var showPersonalityShare = false
    @State private var personalityShareObj = PersonalityObject(id: 0, title: "", description: "", link: "")
    
    var body: some View {
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width > 100 {
                    self.showPersonalityShare = false
                }
        }
        
        return VStack {
            if (!showPersonalityShare) {
                ForEach(personalityObjects, id: \.id) {personalityObj in
                    Button(action: {
                        self.personalityShareObj = personalityObj
                        self.showPersonalityShare = true
                    }) {
                        PersonalityCard(personality: personalityObj)
                    }
                }
            } else {
                Button(action: {self.showPersonalityShare = false}) {
                    VStack {
                        Spacer()
                        
                        Text(self.personalityShareObj.description)
                            .font(.title)
                            .foregroundColor(Color.black)
                        
                        Spacer()
                    }
                .gesture(drag)
                }
            }
        }
    }
}

struct Personality_Previews: PreviewProvider {
    static var previews: some View {
        Personality(line: "Life", personalityObjects: testPersonalityObjects)
    }
}
