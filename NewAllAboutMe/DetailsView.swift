//
//  DetailsView.swift
//  NewAllAboutMe
//
//  Created by Phyllis Hollingshead on 2/14/17.
//  Copyright © 2017 Phyllis Hollingshead. All rights reserved.
//

import UIKit

var hobbyRow:Int?

class DetailsView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var detailsImage: UIImageView!
    @IBOutlet weak var detailsLabel: UILabel!
    
    override func viewDidLoad() {
         super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let hobbyName = hobbies[hobbyRow!].name
        if hobbyName != "" {
            self.title = hobbyName
            detailsLabel.text = hobbies[hobbyRow!].description
            detailsImage.image = hobbies[hobbyRow!].imageName
        }
        else {
            self.title = "Error"
            detailsLabel.text = "There was a problem. Please return to the previous menu and try selecting a hobby again."
            detailsImage.image = UIImage(named: "error.png")
        }
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnChoseImage(_ sender: AnyObject) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.savedPhotosAlbum) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.mediaTypes = [kCIAttributeTypeImage as String]
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        self.dismiss(animated: true, completion: nil)
        if (mediaType.isEqual(to: kCIAttributeTypeImage as String)) {
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            detailsImage.image = image
            hobbies[hobbyRow!].imageName = image
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
