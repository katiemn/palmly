//
//  PersonalityCard.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/26/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct PersonalityCard: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("temp title")
            .font(.custom("DMSans-Regular", size: 36))
                .padding(.leading)
            
            Text("temp description")
            .lineLimit(3)
            .font(Font.custom("DMSans-Regular", size: 20))
                .foregroundColor(Color.gray)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.top)
                .padding(.leading)
            
            Spacer()
            
//            HStack() {
//                Text("Learn More")
//                .font(Font.custom("DMSans-Regular", size: 20))
//
//                Spacer()
//
//                Image("right arrow")
//            }
//            .padding(.leading)
//            .padding(.trailing)
//
            Rectangle()
                .fill(Color.gray)
            .frame(width: 360, height: 2)
                .padding(.leading)
        }
    .foregroundColor(Color.black)
    .padding()
    }
}

struct PersonalityCard_Previews: PreviewProvider {
    static var previews: some View {
        Text("hello")
//        PersonalityCard(personality: testPersonality)
    }
}
