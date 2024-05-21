//
//  ViewController.swift
//  BMI-Calculator
//
//  Created by 강석호 on 5/21/24.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: property
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var topIntroLabel: UILabel!
    @IBOutlet var bottomIntroLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var randomBMIButton: UIButton!
    @IBOutlet var resultButton: UIButton!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

