//
//  UIVariables.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/22/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//
import SwiftUI

//-------------------------------------------------------//
//                  TEST VARIABLES                       //
//-------------------------------------------------------//
var testPersonality = PersonalityObject(id: 0, title: "Meyers-Briggs", description: "Introverted, Intuitive, Thinker, Judger, blaksjdlfkjs slkjfd slkdjg lskdjg lksjg slkdjg lskdjg lskjdg lskdj glkdj glsjej lskdj gjgjke shelek. IJ slkdjg wlkje.",
link: "meyersbriggs.com")

var testTopReadings = [
    ProbableReading(id: 1, meaning: "short", percentage: CGFloat(0.8)),
    ProbableReading(id: 2, meaning: "long", percentage: CGFloat(0.13)),
    ProbableReading(id: 3, meaning: "faint", percentage: CGFloat(0.07))
]

var testPersonalityObjects = [
    PersonalityObject(id: 0, title: "Meyers-Briggs", description: "Introverted, Intuitive, Thinker, Judger",
    link: "meyersbriggs.com"),
    
    PersonalityObject(id: 1, title: "Enneagram", description: "The Intense, Cerebral Type: Pereptive, Innovative, Secretive, and Isolated. Putting more words here to see what happens when there's a lot of words in this area",
    link: "enneagram.com"),
    
    PersonalityObject(id: 2, title: "The Big Five", description: "You are quiet around strangers.",
    link: "thebigfive.com")
]

var testLifestyleTips = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "In ornare quam viverra orci sagittis eu volutpat. Morbi non arcu risus quis varius quam quisque id diam. Nam libero justo laoreet sit amet. Nullam eget felis eget nunc lobortis mattis. Urna neque viverra justo nec ultrices dui sapien eget. Nec feugiat nisl pretium fusce id velit ut tortor. Aliquet enim tortor at auctor urna.",
    "Et ligula ullamcorper malesuada proin. Sagittis purus sit amet volutpat consequat mauris nunc."
]

//-------------------------------------------------------//
//                      STRUCTURES                       //
//-------------------------------------------------------//
struct ProbableReading {
    var id: Int
    var meaning: String
    var percentage: CGFloat
    
}

struct PersonalityObject {
    var id: Int
    var title: String
    var description: String
    var link: String
}

//-------------------------------------------------------//
//                          COLORS                       //
//-------------------------------------------------------//
var topDividerGrey = Color(red: 0.898, green: 0.898, blue: 0.898)
var descriptionGrey = Color(red: 0.686, green: 0.670, blue: 0.670)
