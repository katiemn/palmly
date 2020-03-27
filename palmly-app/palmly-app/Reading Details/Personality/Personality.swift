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
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(personalityObjects, id: \.id) {personalityObj in
                    NavigationLink(destination:
                    PersonalityShareable(personality: personalityObj)) {
                        PersonalityCard(personality: personalityObj)
                    }
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
