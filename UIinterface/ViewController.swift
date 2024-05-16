//
//  ViewController.swift
//  UIinterface
//
//  Created by Shuhrat Sodiqov on 16/05/24.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var slider: UISlider!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var textField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSlider()
        setupMailLabel()
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
    }

    @IBAction func segmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segmented control"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segmented control"
            mainLabel.textColor = .darkText
        default:
            mainLabel.text = "The third segmented control"
            mainLabel.textColor = .magenta
        }
    }
    
   
    @IBAction func doneButtonAction() {
        guard let inputText = textField.text, !inputText.isEmpty else {
            showAlert(withTitle: "Text field is empty", and: "Please enter you name")
            return
        }
        
//        if let _ = Double(inputText) {
//            showAlert(withTitle: "Wrong format", and: "Please enter you name")
//            return
//        }
        let usermamePattern = "^[a-zA-z ]{3,20}$"
        let isUsernameValid = NSPredicate(format: "SELF MATCHES %@", usermamePattern)
            .evaluate(with: inputText)
        
        if !isUsernameValid {
            showAlert(withTitle: "Wrong format", and: "Please enter you name")
            return
        }
            
        mainLabel.text = inputText
        textField.text = ""
    }
    
    @IBAction func sliderAction(_ sender: Any) {
        mainLabel.text = slider.value.formatted()
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(slider.value))
        //view.alpha = CGFloat(slider.value)
    }
    
    private func setupMailLabel() {
           mainLabel.text = slider.value.formatted()
           mainLabel.font = .systemFont(ofSize: 30)
           mainLabel.textAlignment = .center
           mainLabel.numberOfLines  = 2
       }
    
    private func setupSlider() {
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .green
        slider.thumbTintColor = .link
        slider.minimumValueImage = UIImage(systemName: "1.lane")
        slider.maximumValueImage = UIImage(systemName: "2.lane")
    }
    
    private func showAlert(withTitle title: String, and massage: String) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

