//
//  ViewController.swift
//  palmly-app
//
//  Created by Katie Nguyen on 2/17/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import UIKit
import Foundation

class TakePhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBAction func unwindToTakePhoto(segue: UIStoryboardSegue) {}
    @IBOutlet weak var imagePicked: UIImageView!
    @IBOutlet weak var detectButton: UIButton!
    var imageData: NSData? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        detectButton.isEnabled = false
        detectButton.accessibilityIdentifier = "detectButton"
    }
    
    @IBAction func openCameraButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func openPhotoLibraryButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as? UIImage
        imagePicked.image = image
        imageData = image!.jpegData(compressionQuality: 0.95)! as NSData
        detectButton.isEnabled = true
        dismiss(animated:true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        _ = segue.destination as! ReadingViewController
    }
    
}

