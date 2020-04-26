//
//  PersonalityShareable.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/26/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct PersonalityShareable: View {
    var personality: PersonalityObject
    
    var body: some View {
        Text(personality.description)
        .padding()
    }
}

struct PersonalityShareable_Previews: PreviewProvider {
    static var previews: some View {
        PersonalityShareable(personality: testPersonality)
    }
}
