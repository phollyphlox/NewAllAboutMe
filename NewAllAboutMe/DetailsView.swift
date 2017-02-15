//
//  DetailsView.swift
//  NewAllAboutMe
//
//  Created by Phyllis Hollingshead on 2/14/17.
//  Copyright © 2017 Phyllis Hollingshead. All rights reserved.
//

import UIKit
protocol HobbyTableviewDelegate{
    func detailsDidFinish(controller: DetailsView)
}
var hobbyName:String?

class DetailsView: UIViewController {
    
    var delegate:HobbyTableviewDelegate? = nil
    

    @IBOutlet weak var detailsImage: UIImageView!
    @IBOutlet weak var detailsLabel: UILabel!
    
    override func viewDidLoad() {
        

        // Do any additional setup after loading the view.
        
        if hobbyName == "Knitting" {
            self.title = "Knitting"
            detailsLabel.text = "Knitting is a textile art that uses 2 pointed needles to form knots in yarn to create fabric."
            detailsImage.image = UIImage(named: "knitting.jpg")
        }
        else if hobbyName == "Crochet" {
            self.title = "Crochet"
            detailsLabel.text = "Crocheting is a textile art that uses a hook to form knots in yarn to create fabric."
            detailsImage.image = UIImage(named: "crochet.jpg")
        }
        else if hobbyName == "Reading" {
            self.title = "Reading"
            detailsLabel.text = "Reading is relaxing and fun."
            detailsImage.image = UIImage(named: "reading.jpg")
        }
        else if hobbyName == "Hiking" {
            self.title = "Hiking"
            detailsLabel.text = "Hiking is fun and it is good exercise."
            detailsImage.image = UIImage(named: "hiking.jpg")
        }
        else if hobbyName == "Swimming" {
            self.title = "Swimming"
            detailsLabel.text = "Swimming is fun and it is good exercise"
            detailsImage.image = UIImage(named: "swimming.jpg")
        }
        else {
            self.title = "Error"
            detailsLabel.text = "There was a problem. Please return to the previous menu and try selecting an item again."
            detailsImage.image = UIImage(named: "error.png")
        }
        
        super.viewDidLoad()
    }
    
    @IBAction func backButton(sender: UIBarButtonItem) {
        if (delegate != nil) {
            delegate!.detailsDidFinish(controller: self)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
