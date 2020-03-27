//
//  PersonalityCard.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/26/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct PersonalityCard: View {
    var personality: PersonalityObject
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.personality.title)
            .font(Font.custom("DMSans", size: 36))
            
            Text(self.personality.description)
            .lineLimit(3)
            .font(Font.custom("DMSans", size: 18))
            .foregroundColor(descriptionGrey)
                .fixedSize(horizontal: false, vertical: true)
                .frame(width: 350, height: 90, alignment: .topLeading)
                .padding(.top)
            
            HStack(spacing: 0) {
                Text("Learn More")
                .font(Font.custom("DMSans", size: 16))
                    .frame(width: 175, alignment: .leading)
                
                Image("back arrow")
                .frame(width: 175, alignment: .trailing)
            }
            .frame(width: 350)
            
            TopBarDivider(yOffset: 0, screenWidth: 400)
        }
    .padding()
    }
}

struct PersonalityCard_Previews: PreviewProvider {
    static var previews: some View {
        PersonalityCard(personality: testPersonality)
    }
}
