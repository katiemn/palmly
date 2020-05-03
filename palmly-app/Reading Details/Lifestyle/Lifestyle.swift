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
    @State private var lifestyleTips: [String] = []
    
    @ObservedObject var viewRouter: ViewRouter

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
        
        return VStack {
            if (self.lifestyleTips.count > 0) {
                Spacer()
                Text(self.lifestyleTips[self.selected])
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.custom("DMSans-Regular", size: 24))

                Spacer()

                HStack(alignment: .center) {
                    ForEach(0 ..< self.lifestyleTips.count) { index in
                        Button (action: {self.changeTab(tabIndex: index)})
                        {
                            Circle()
                            .fill((index == self.selected) ? selectedCircleTabColor : circleTabColor)
                            .frame(width: 15, height: 15)
                        }
                    }
                }
                
                Spacer()
            }
        }
        .padding()
        .gesture(drag)
        .onAppear {self.lifestyleTips = self.getLifestyleTips(type: self.viewRouter.personalityType)}
    }

    func getLifestyleTips(type: Int) -> [String] {
      switch type {
        case 2:
          return [
            "Take some time in the morning to write down your goals and needs for the day. This will help you remember to take care of yourself even though your day may be filled helping others.",
            "Set aside some alone time to focus on personal goals and projects.",
            "Ask others how they would like to be helped before jumping in."
          ]

        case 3:
          return [
            "Try to start your day without social media. Use this time to focus on your version of success instead of comparing yourself to others.",
            "Put some creative or non-competitive tasks on your to-do list.",
            "Remember that your accomplishments are only part of who you are. Strive to make genuine connections with others that are not based on your achievements."
          ]

        case 5:
          return [
            "Start your day with some stretching or light movement to get you out of your head and into your body. Allow yourself to be present in the moment.",
            "Remember, your research is only helpful if you act on it. Try scheduling some blocks of time in your day for research and others for accomplishing tasks.",
            "Don’t be afraid of getting close to other people. Allowing your heart to take over at times will not keep your mind from staying sharp."
          ]

        case 6:
          return [
            "Take note of your present surroundings. Find things in the current moment that you enjoy and leave future problems in the future.",
            "For big or challenging tasks, break them up into smaller, more manageable tasks. This will help you feel secure that you can complete each step successfully and finish the larger project.",
            "Use your strength of commitment and loyalty to build strong relationships with others. Let people show you who they are before assuming their intentions."
          ]
        
        case 7:
          return [
            "Try journaling all of your thoughts in the morning. Putting your ideas on paper will help you clear your mind and focus on the day ahead.",
            "Carve your tasks into time blocks to make sure you don’t overschedule yourself. Remember to include self-care and alone time in these blocks too.",
            "Remember that commitment can be positive. You can have many different adventures with the same person."
          ]

        case 8:
          return [
            "Try meditating before starting your day. This may help you create some much needed space between your feelings and your actions.",
            "When you have a lot of small tasks, try writing out the bigger goal that these tasks will help you accomplish.",
            "Don’t be afraid to show your emotions to those you love. Your vulnerability will not undermine your leadership qualities."
          ]

        case 9:
          return [
            "Try to keep your to-do list short and finish the hardest task first. Giving yourself a clear end point will help you reach your goals.",
            "Invite others to collaborate with you. Then, your productive time can also be relationship building time.",
            "Speak up for yourself and assert your opinions. Sharing your true self will strengthen relationships."
          ]

        default:
          return []
      }

    }
}


struct Lifestyle_Previews: PreviewProvider {
    static var previews: some View {
        Text("lifestyle")
    }
}
