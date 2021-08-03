//
//  ViewController.swift
//  Salon_Task7
//
//  Created by 相良 詠斗 on 2021/08/02.
//

import UIKit

class AdditionViewController: UIViewController {


    @IBOutlet weak private var topTextField: UITextField!
    @IBOutlet weak private var downTextField: UITextField!
    @IBOutlet weak private var resultLabel: UILabel!

    @IBAction private func calculationAction(_ sender: Any) {

        guard let topText = topTextField.text else { return }
        guard let downText = downTextField.text else { return }
        guard let topNum = NumberFormatter().number(from: topText) as? Int else { return }
        guard let downNum = NumberFormatter().number(from: downText) as? Int else { return }

        let result = calculationModel.addition(num1: topNum, num2: downNum)
        resultLabel.text = String(result)
    }

    private let calculationModel = CalculationModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.topTextField.keyboardType = UIKeyboardType.numberPad
        self.downTextField.keyboardType = UIKeyboardType.numberPad

        let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGR.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGR)
    }

    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
