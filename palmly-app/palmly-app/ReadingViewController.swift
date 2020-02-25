//
//  ReadingViewController.swift
//  palmly-app
//
//  Created by Katie Nguyen on 2/22/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//
import UIKit

class ReadingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var readingResultsTableView: UITableView!
    var resultsFromImage: [String] = ["", "", ""]
    var attributeData: [String] = ["Life", "Head", "Heart"]
    
    struct ResultData {
        var att:String
        var attValue:String
    }
    
    var tableData: [ResultData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attributeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "readingProtoCell", for: indexPath) as! ReadingResultsTableViewCell
        cell.attribute.text = attributeData[indexPath.row]
        cell.attributeValue.text = resultsFromImage[indexPath.row]
        return cell
    }
    
//    private func display(detectResults: DetectResult) {
//        detectResult = detectResults.faces
//        //what to return if no face is detected
//        if (detectResult.count == 0) {
//            resultsFromImage[0] = "None"
//            resultsFromImage[1] = "None"
//            resultsFromImage[2] = "None"
//            detectResultsTableView.reloadData()
//        } else {
//            //loop through dictionary of emotions and only return if > 50%
//            let feelings = detectResult[0].attributes.emotion
//            let mirror = Mirror(reflecting: feelings)
//            var strongestEmotions: String = ""
//            for child in mirror.children {
//                let value = child.value as? Float
//                if (Float(50).isLess(than: value!)) {
//                    strongestEmotions += child.label! + " "
//                }
//            }
//            resultsFromImage[0] = (String(detectResult[0].attributes.age.value))
//            resultsFromImage[1] = (detectResult[0].attributes.gender.value)
//            resultsFromImage[2] = (strongestEmotions)
//            face_token = detectResult[0].face_token
//            facesetParams.face_token = detectResult[0].face_token
//            detectResultsTableView.reloadData()
//            api.faceset(with: facesetParams, then: storeInfo, fail: failureCallback ?? report)
//        }
//    }
    
}
