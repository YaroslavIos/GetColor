//
//  ViewController.swift
//  GetColor
//
//  Created by Ярослав Любиченко on 5.2.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    @IBOutlet var viewColor: UIView!
    
    @IBOutlet var redResult: UILabel!
    @IBOutlet var greenResult: UILabel!
    @IBOutlet var blueResult: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    var color: UIColor!
    unowned var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColor.layer.cornerRadius = 18
        
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        
        viewColor.backgroundColor = color
        
        setValue(for: redSlider, greenSlider, blueSlider)
        setValue(for: redResult, greenResult, blueResult)
        setValue(for: redTF, greenTF, blueTF)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func redSlider(_ sender: UISlider) {
        switch sender {
        case redSlider:
            setValue(for: redResult)
            setValue(for: redTF)
        case greenSlider:
            setValue(for: greenResult)
            setValue(for: greenTF)
        default:
            setValue(for: blueResult)
            setValue(for: blueTF)
        }
        
        changeColor()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.updateBackground(for: viewColor.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}

// MARK: - Private Methods

extension SettingsViewController {
    
    private func changeColor() {
        viewColor.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redResult:
                label.text = string(from: redSlider)
            case greenResult:
                label.text = string(from: greenSlider)
            default:
                label.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTF:
                textField.text = string(from: redSlider)
            case greenTF:
                textField.text = string(from: greenSlider)
            default:
                textField.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValue(for colorSliders: UISlider...) {
        let ciColor = CIColor(color: color)
        colorSliders.forEach { slider in
            switch slider {
            case redSlider:
                redSlider.value = Float(ciColor.red)
            case greenSlider:
                greenSlider.value = Float(ciColor.green)
            default:
                blueSlider.value = Float(ciColor.blue)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
  
    private func showAlertController( title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController( title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            textField?.text = "1.00"
            textField?.becomeFirstResponder()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate

extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {
        showAlertController(title: "Wrong format!", message: "Please enter correct value!")
        return
    }
    guard let currentValue = Float(text), (0...1).contains(currentValue) else {
        showAlertController(
            title: "Wrong format!",
            message: "Please enter a correct value!",
            textField: textField
        )
        return
    }
        
        switch textField {
        case redTF:
            redSlider.setValue(currentValue, animated: true)
            setValue(for: redResult)
        case greenTF:
            greenSlider.setValue(currentValue, animated: true)
            setValue(for: greenResult)
        default:
            blueSlider.setValue(currentValue, animated: true)
            setValue(for: blueResult)
        }
        
        changeColor()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard textField != redTF else { return }
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: textField,
            action: #selector(resignFirstResponder)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
}
