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
    var imageBuffer: CVPixelBuffer?
    private var heartResult: Result?
    private var headResult: Result?
    private var lifeResult: Result?
    private var lifeReading: String = ""
    private var headReading: String = ""
    private var heartReading: String = ""
    private var heartModelDataHandler: ModelDataHandler? = ModelDataHandler(modelFileInfo: MobileNet.heartModelInfo, labelsFileInfo: MobileNet.heartLabelsInfo)
    private var lifeModelDataHandler: ModelDataHandler? = ModelDataHandler(modelFileInfo: MobileNet.lifeModelInfo, labelsFileInfo: MobileNet.lifeLabelsInfo)
    private var headModelDataHandler: ModelDataHandler? = ModelDataHandler(modelFileInfo: MobileNet.headModelInfo, labelsFileInfo: MobileNet.headLabelsInfo)
    @IBAction func goBackToPhoto(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToPhoto", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readingResultsTableView.delegate = self
        readingResultsTableView.dataSource = self
        heartResult = heartModelDataHandler?.runModel(onFrame: imageBuffer!)
        heartReading = heartResult!.inferences[0].label
        headResult = headModelDataHandler?.runModel(onFrame: imageBuffer!)
        headReading = headResult!.inferences[0].label
        lifeResult = lifeModelDataHandler?.runModel(onFrame: imageBuffer!)
        lifeReading = lifeResult!.inferences[0].label
        display(life: lifeReading, head: headReading, heart: heartReading)
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
    
    private func display(life: String, head: String, heart: String) {
        switch life {
        case "broken":
            resultsFromImage[0] = "Each break in this line represents a traumatic experience that has had a significant impact on your life choices."
        case "faint":
            resultsFromImage[0] = "You may find it helpful to chill out now and then. For example, yoga, meditation, walking, or taking time for yourself could do you some good."
        case "long":
            resultsFromImage[0] = "You are a rock who people often count on to remain strong during difficult times."
        case "short":
            resultsFromImage[0] = "When life becomes overly stressful, remaining busy helps you feel safe and secure."
        default:
            resultsFromImage[0] = life
        }
        
        switch head {
        case "long curved":
            resultsFromImage[1] = "You are a creative thinker who can image various possible outcomes or approaches to any given situation."
        case "long straight":
            resultsFromImage[1] = "You often find yourself pondering things in great detail, over and over before eventually coming to a decision."
        case "short":
            resultsFromImage[1] = "You are a quick thinker who reaches conclusions without any trouble, making you a very decisive individual."
        case "splits":
            resultsFromImage[1] = "You are very sensitive to others, meaning that you can very easily see someone else's perspective from their shoes. This means that you may change your opinion every now and then."
        default:
            resultsFromImage[1] = head
        }
        
        switch heart {
        case "long curved":
            resultsFromImage[2] = "Your passions and desires drive you, and you are very upfront about that, making it known to anyone who will listen."
        case "long straight":
            resultsFromImage[2] = "You are a rational and analytic thinker who always considers the feelings of others. Those around you very much value you for this trait."
        case "short curved":
            resultsFromImage[2] = "You are a reserved person and prefer small groups to big gatherings. You tend to open up more in one-on-one scenarios."
        case "short straight":
            resultsFromImage[2] = "You are an individual that needs your freedom. In this regard, you show your love and affection through actions rather than words."
        default:
            resultsFromImage[2] = heart
        }
        
        readingResultsTableView.reloadData()
    }
}
