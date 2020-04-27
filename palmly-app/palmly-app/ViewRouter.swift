//
//  ViewRouter.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/30/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//
import Foundation
import Combine
import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Int = 0
    @Published var currentTab: Int = 0
    @Published var currentLineIndex: Int = 0
    
    @Published var imageBuffer: CVPixelBuffer?
    
    @Published var lines = ["Life", "Head", "Heart"]
    @Published var results: [Result] = []
    @Published var readings: [String] = []
}
