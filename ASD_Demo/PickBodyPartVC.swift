//
//  PickBodyPartVC.swift
//  ASD_Demo
//
//  Created by Tyler Burnam on 11/6/16.
//  Copyright © 2016 Dali. All rights reserved.
//

import UIKit

class PickBodyPartVC: UIViewController {

    @IBOutlet weak var repeatLabel: UILabel!
    @IBOutlet weak var allDoneLabel: UILabel!
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var repeatButton: UIButton!
    @IBOutlet weak var allDoneButton: UIButton!
    
    
    var isSwitching = false
    
    @IBAction func touchHead(_ sender: Any) {
        DTO.dto.bodyPartChoice = "Head"
    }
    @IBAction func touchTummy(_ sender: Any) {
        DTO.dto.bodyPartChoice = "Tummy"
    }
    @IBAction func touchRightArm(_ sender: Any) {
        DTO.dto.bodyPartChoice = "Ears"
    }
    @IBAction func touchLeftArm(_ sender: Any) {
        DTO.dto.bodyPartChoice = "Arms"
    }
    @IBAction func touchLeftLeg(_ sender: Any) {
        DTO.dto.bodyPartChoice = "Legs"
    }
    @IBAction func touchRightLeg(_ sender: Any) {
        DTO.dto.bodyPartChoice = "Legs"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Revisiting the view
        if (isSwitching) {
            topLabel.text = "Let's do another one!"
            repeatLabel.isHidden = false
            repeatButton.isHidden = false
            allDoneLabel.isHidden = false
            allDoneButton.isHidden = false
            
            isSwitching = false
        }
        else {
            repeatLabel.isHidden = true
            repeatButton.isHidden = true
            allDoneLabel.isHidden = true
            allDoneButton.isHidden = true
        }

        // Do any additional setup after loading the view.
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
