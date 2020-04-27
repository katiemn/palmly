//
//  ReadingFuncs.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/23/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

func getHeadReading(classification: String) -> String {
    let readings:[String:String] = [
        "short": "You’re a fast thinker who reaches conclusions without any hemming and hawing.",
        "long straight": "Analyze much? You often find yourself mulling things over (and over) before coming to a decision.",
        "splits": "Sensitive to others, you can easily see someone else’s perspective. This means you may change your opinion now and then.",
        "long curved": "You’re a creative thinker who can imagine many possible outcomes or approaches to any situation."
    ]
    return readings[classification]!
}

func getHeartReading(classification: String) -> String {
    let readings:[String:String] = [
        "long straight": "You’re a rational, analytical thinker who always considers others’ feelings, and people appreciate that about you.",
        "short straight": "You need your freedom. You show your love through actions more than words.",
        "long curved": "Your passions and desires drive you, and you don’t care who knows it.",
        "short curved": "You are reserved and prefer small groups to big ones. You open up in one-on-one settings.",
        "xs": "You’ve experienced a deep personal betrayal.",
        "splits": "You have a habit of putting your emotions on the back burner to meet others’ needs."
    ]
    return readings[classification]!
}

func getLifeReading(classification: String) -> String {
    let readings:[String:String] = [
        "long": "You’re a rock whom people count on to stay strong in difficult times.",
        "short": "When the going gets tough, keeping busy helps you feel safe and secure.",
        "faint": "You may need to chill out now and then. Yoga, meditation, walking, or taking time to play could do you good.",
        "broken": "Each break in the line represents a traumatic experience that has had an impact on your life choices."
    ]
    return readings[classification]!
}

func getReading(line: String, classification: String) -> String {
    switch line {
        case "Head":
            return getHeadReading(classification: classification)
        
        case "Life":
            return getLifeReading(classification: classification)
        
        case "Heart":
            return getHeartReading(classification: classification)
        
        default:
            return ""
    }
}
