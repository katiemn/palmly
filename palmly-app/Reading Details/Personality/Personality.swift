//
//  Personality.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/22/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct Personality: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    @State var personalityType: Int = 0
    @State var headlines: [String] = []
    @State var article: String = ""
//    var personalityObjects: [PersonalityObject]
    @State var showPersonalityShare = false
//    @State private var personalityShareObj = PersonalityObject(id: 0, title: "", description: "", link: "")
    
    var body: some View {
//        let drag = DragGesture()
//            .onEnded {
//                if $0.translation.width > 100 {
//                    self.showPersonalityShare = false
//                }
//        }
        
        VStack(alignment: .leading) {
            
            if (!showPersonalityShare) {
                if self.headlines.count == 1 {
                    Text("Enneagram Type " + String(self.personalityType))
                    .font(Font.custom("DMSans", size: 26))

                    Button(action: {self.showPersonalityShare = true}) {
                        Text("Learn More")
                        .font(Font.custom("DMSans", size: 18))
                            .foregroundColor(Color.gray)
                    }
                    Spacer()

                    Text(self.headlines[0])
                    .font(Font.custom("DMSans", size: 18))

                    Spacer()
                } else {
                    Text("Enneagram Type " + String(self.personalityType))
                    .font(Font.custom("DMSans", size: 26))
                    
                    Spacer()
                    
                    ForEach((0 ..< self.headlines.count), id: \.self) {index in
                        Button(action: {
                            self.showPersonalityShare = true
                        }) {
                            if (index % 2 == 0) {
                                Spacer()
                                Text(self.headlines[index])
                                .font(Font.custom("DMSans", size: 18))
//                                .frame(alignment: .leading)
                                
                                Spacer()
                            } else {
                                Spacer()
                                Text(self.headlines[index])
                                .font(Font.custom("DMSans", size: 18))
//                                    .frame(alignment: .trailing)
                                
                                Spacer()
                            }
                        }
                        .foregroundColor(Color.black)
                    }
                }
                    
            } else {
                Spacer()
                
                Text("Enneagram Type " + String(self.personalityType))
                .font(Font.custom("DMSans", size: 26))
//                Button(action: {self.showPersonalityShare = true}) {
//                    Text("Learn More")
//                    .font(Font.custom("DMSans", size: 18))
//                        .foregroundColor(Color.gray)
//                }
                
                Spacer()
                
                Text(self.article)
                .font(Font.custom("DMSans", size: 18))
                    .lineSpacing(10)
                    .padding()
                
                Spacer()

            }
//            if (!showPersonalityShare) {
//                ForEach(personalityObjects, id: \.id) {personalityObj in
//                    Button(action: {
//                        self.personalityShareObj = personalityObj
//                        self.showPersonalityShare = true
//                    }) {
//                        PersonalityCard(personality: personalityObj)
//                    }
//                }
//            } else {
//                Button(action: {self.showPersonalityShare = false}) {
//                    VStack {
//                        Spacer()
//
//                        Text(self.personalityShareObj.description)
//                            .font(.title)
//                            .foregroundColor(Color.black)
//
//                        Spacer()
//                    }
//                .gesture(drag)
//                }
//            }
        }
        .onAppear() {
            self.personalityType = self.getPersonalityType(line: self.viewRouter.lines[self.viewRouter.currentLineIndex], classification: self.viewRouter.readings[self.viewRouter.currentLineIndex])
            self.headlines = self.getHeadlines(type: self.personalityType)
            self.article = self.getArticle(type: self.personalityType)
        }
    }
    
    func getPersonalityType(line: String, classification: String) -> Int {
        if (line == "life") {
            if (classification == "broken") {
                return 3
            } else if (classification == "faint") {
                return 6
            } else if (classification == "long") {
                return 8
            } else {
                return 7
            }
        } else if (line == "heart") {
            if (classification == "long curved") {
                return 2
            } else if (classification == "long straight") {
                return 6
            } else if (classification == "short curved") {
                return 9
            } else {
                return 5
            }
        } else {
            if (classification == "long cuved") {
                return 5
            } else if (classification == "long straight") {
                return 8
            } else if (classification == "short") {
                return 5
            } else {
                return 2
            }
        }
        return 0
    }
    
    func getHeadlines(type: Int) -> [String] {
        if (type == 2) {
            return ["You value and are attracted to love", "The proper understanding of freedom enables you to live within the natural laws and limits of reality."]
        } else if (type == 3) {
            return ["You are attracted to and value efficiency, industriousness, and competence", "Your objective paradigm is hope.", "Your objective paradigm is accompanied by truthfulness.", "You have a natural organizational ability."]
        } else if (type == 5) {
            return ["You are attracted to and value wisdom, knowledge, and learning."]
        } else if (type == 6) {
            return ["You are attracted to and value loyalty"]
        } else if (type == 7) {
            return ["You are attracted to and value joy, variety, and excitement.", "Your persistent work in the present and bringing projects to completion ar ebehaviors that flow from responsible action nad the virute of sobriety."]
        } else if (type == 8) {
            return ["You are attracted to and appreciate power.", "You believe that the laws of the universe are inherently just.", "Innocence is the attitude that flows from your objective paradigm.", "You can tell the truth in a challening but up-building way."]
        } else if (type == 9) {
            return ["You are attracted to and value peace, harmony, and unity."]
        }
        
        return [""]
    }
    
    func getArticle(type: Int) -> String {
        if (type == 2) {
            return "TWOS value and are attracted to love. They want to be generous persons, seeking to make the world a more loving place to live in. Harmonious intimate mutual relationships are what life is all about. \n\n The proper understanding of freedom enables TWOS to live within the natural laws and limits of reality. Interdependence, which lies between the extremes of dependence/codependence and an exaggerated independence, is the mature stance of adults. Being free means TWOS can give or not give, receive or not receive."
        } else if (type == 3) {
            return "THREES are attracted to and value efficiency, industriousness, and competence. They want to be productive persons, seeking to make the world a more efficient place to live in. Bringing projects to completion, accomplishing goals, working effectively is what life is about. \n\n Hope is the principle and attitude THREES have to keep them living in the real world. Hope believes the cosmos works effectively within and according to its own laws. It will continue to run smoothly even when THREES are not working. Entropy won’t occur the instant THREES take time off. \n\n The state that accompanies THREES objective paradigm is truthfulness, the acceptance and expression of their inner self as it actually is without covering, exaggerating, or marketing it with external images, roles, and personas. THREES remain true to themselves and their commitments vs assuming whatever appearance they believe will make them look successful in the eyes of others. \n\n THREES have a natural organizational ability, easily assessing a situation, setting goals, and working efficiently and single mindedly toward them. They know how to get things done. They are optimistic, enthusiastic, and self confident. THREES are motivated and motivating."
        } else if (type == 5) {
            return "FIVES are attracted to and value wisdom, knowledge, and learning. They want to understand the world and make it a more reasonable place to live in. Having insights, learning about the nature of things, and seeing how everything fits together is what life is all about."
        } else if (type == 6) {
            return "SIXES are attracted to and value loyalty. They desire to be faithful, conscientious, responsible persons, keeping their word and honoring their commitments. They want to make the world a safer, more secure, more reliable, trustworthy place to live in. Doing your duty and honoring your traditions is what life is all about. \n\n Faith is the objective principle that keeps SIXES connected to their true self and to reality. When SIXES believe in themselves and in their inner authority, they have the certitude that they are already on the side of Being. \n\n The state that accompanies the SIXES objective paradigm is courage, an inner strength that comes from being in touch with one’s inner self and with the objective laws of reality. \n\n SIXES actively scan their surroundings for what might go wrong. They have an intuitive sense for danger and so are rarely caught off guard. SIXES respond well in emergencies because they are usually prepared for them. When crises arise, they respond spontaneously and effectively. Since SIXES are conscientious, responsible, and value doing their duty, they make excellent stabilizers and maintainers in organizations and systems."
        } else if (type == 7) {
            return "SEVENS are attracted to and value joy, variety, and excitement. They desire to be happy persons, seeking to make the world a more delightful place to live in. SEVENS want to taste and experience all the possibilities life has to offer. Having fun and being positive is what life is all about. \n\n Persistent work in the present and bringing projects to completion are behaviors that flow from responsible action and the virtue of sobriety. Work and play become indistinguishable when you do what you love and love what you’re doing. SEVENS have a great appreciation for life and want to celebrate and enjoy it."
        } else if (type == 8) {
            return "EIGHTS are attracted to and appreciate power. They desire to be strong, independent, straightforward, assertive persons, who use their strength and influence to make the world a more just place to live in. \n\n The objective principle that keeps EIGHTS aligned with their real self and with reality is the realization that the laws of the universe are inherently just and that what goes around, comes around. \n\n Innocence is the attitude that flows from the EIGHTS’ objective paradigm and keeps EIGHTS connected to their better self, to others, and to reality. Innocence is the disposition of not harming, expressed by the attitude of why would you want to harm anyone and why would anyone want to harm you. \n\n EIGHTS can tell the truth, tell it like it is, in a way that is challenging and up-building while not being punitive or tearing down."
        } else if (type == 9) {
            return "NINES are attracted to and value peace, harmony, and unity. They desire to make the world an ecumenical, harmonious, conflict-free place to live in. They like being peaceful, calm, and ordered and prefer to go with the flow. The universe is unfolding as it should and they see no need to push the river since it’s flowing fine by itself. Being at one with yourself and your surroundings is what life is all about."
        }
        return ""
    }
}

struct Personality_Previews: PreviewProvider {
    static var previews: some View {
        Personality(viewRouter: ViewRouter())
//        Personality(line: "Life", personalityObjects: testPersonalityObjects)
    }
}
