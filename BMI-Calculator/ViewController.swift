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
        
        setConfigure()
        hideKeyBoardWhenTappedScreen()
    }
    
    //MARK: UI Setting
    func setConfigure() {
        titleLabel.text = "BMI Calculator"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
        topIntroLabel.text = "당신의 BMI 지수를"
        topIntroLabel.font = UIFont.systemFont(ofSize: 17)
        
        heightLabel.text = "키가 어떻게 되시나요?"
        heightLabel.font = UIFont.systemFont(ofSize: 17)
        
        weightLabel.text = "몸무게가 어떻게 되시나요?"
        weightLabel.font = UIFont.systemFont(ofSize: 17)
        
        setTextField(field: heightTextField)
        setTextField(field: weightTextField)
        
        randomBMIButton.setTitle("랜덤으로 BMI 계산하기", for: .normal)
        randomBMIButton.setTitleColor(.red, for: .normal)
        randomBMIButton.backgroundColor = .clear
        
        resultButton.setTitle("결과 확인", for: .normal)
        resultButton.layer.cornerRadius = 10
        resultButton.backgroundColor = .purple
        resultButton.tintColor = .white
    }
    
    func setTextField(field: UITextField) {
        field.layer.cornerRadius = 15
        field.layer.borderColor = UIColor.black.cgColor
        field.layer.borderWidth = 1
        field.keyboardType = .numberPad
        field.isSecureTextEntry = true
    }
    
    //MARK: Action
    func hideKeyBoardWhenTappedScreen() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapHandler() {
        self.view.endEditing(true)
    }
    
    @IBAction func randomButtonClicked(_ sender: UIButton) {
        let heightRandom = Int.random(in: 150...180)
        heightTextField.text = "\(heightRandom)"
        
        let weightRandom = Int.random(in: 40...100)
        weightTextField.text = "\(weightRandom)"
    }
    
    @IBAction func resultButtonClicked(_ sender: UIButton) {
        //체중(kg) / 키(m)의 제곱
        let height = Double(heightTextField.text!)!
        let weight = Double(weightTextField.text!)!
        let bmi = weight/(height*height*0.0001)
        
        var bmiAlert = ""
        
        if heightTextField.text == "" || weightTextField.text == "" {
            
            let alert1 = UIAlertController(title: "신장과 체중을 입력하세요", message: "", preferredStyle: .alert)
            present(alert1, animated: true)
            return
        }
        
        if bmi >= 40 {
            bmiAlert = "3단계 비만입니다"
        } else if bmi >= 30 && bmi < 40 {
            bmiAlert = "2단계 비만입니다"
        } else if bmi >= 25 && bmi < 30 {
            bmiAlert = "1단계 비만입니다"
        } else if bmi >= 18.5 && bmi < 25 {
            bmiAlert = "정상입니다"
        } else {
            bmiAlert = "저체중입니다"
        }
        
        let alert = UIAlertController(title: bmiAlert, message: "", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .default)
        alert.addAction(confirm)
        present(alert, animated: true)
    }
    
    @IBAction func hiddenButtonClicked(_ sender: UIButton) {
        weightTextField.isSecureTextEntry = false
    }
}

