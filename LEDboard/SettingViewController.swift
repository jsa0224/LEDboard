//
//  SettingViewController.swift
//  LEDboard
//
//  Created by 정선아 on 2022/02/10.
//

import UIKit

protocol LEDBoardSettingDelegate: AnyObject {
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class SettingViewController: UIViewController {

    @IBOutlet weak var textFleid: UITextField!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    
    weak var delegate: LEDBoardSettingDelegate?
    var ledText: String?
    var textColor: UIColor = .yellow
    var backgroundColor: UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()

    }
    
    private func configureView() {
        if let ledText = ledText {
            self.textFleid.text = ledText
        }
        self.ChangeTextColor(color: self.textColor)
        self.ChangeBackgroundColor(color: self.backgroundColor)
    }
    
    @IBAction func tapTextButton(_ sender: UIButton) {
        if sender == self.yellowButton {
            self.ChangeTextColor(color: .yellow)
            self.textColor = .yellow
        } else if sender == self.purpleButton {
            self.ChangeTextColor(color: .purple)
            self.textColor = .purple
        } else {
            self.ChangeTextColor(color: .green)
            self.textColor = .green
        }
    }
    
    @IBAction func tapBackgroundButton(_ sender: UIButton) {
        if sender == self.blackButton {
            self.ChangeBackgroundColor(color: .black)
            self.backgroundColor = .black
        } else if sender == self.blueButton {
            self.ChangeBackgroundColor(color: .blue)
            self.backgroundColor = .blue
        } else {
            self.ChangeBackgroundColor(color: .orange)
            self.backgroundColor = .orange
        }
    }
    
    @IBAction func tapSaveButton(_ sender: UIButton) {
        self.delegate?.changedSetting(
            text: self.textFleid.text,
            textColor: self.textColor,
            backgroundColor: self.backgroundColor)
        self.navigationController?.popViewController(animated: true)
    }
    
    private func ChangeTextColor(color : UIColor) {
        self.yellowButton.alpha = color == UIColor.yellow ? 1 : 0.2
        self.purpleButton.alpha = color == UIColor.purple ? 1 : 0.2
        self.greenButton.alpha = color == UIColor.green ? 1 : 0.2
    }
    
    private func ChangeBackgroundColor(color : UIColor) {
        self.blackButton.alpha = color == UIColor.black ? 1 : 0.2
        self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
        self.orangeButton.alpha = color == UIColor.orange ? 1 : 0.2
    }
}
