/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The model for an individual landmark.
*/

import SwiftUI
import CoreLocation

struct Handline: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var meanings: Dictionary<String, String>
}
