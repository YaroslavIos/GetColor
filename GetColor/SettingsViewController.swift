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
    
    var color: UIColor!
    unowned var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColor.layer.cornerRadius = 18
        
        viewColor.backgroundColor = color
        initialViewBackground()
        initialPositionOfSliders()
        takeValuesOfLabels(for: redResult, greenResult, blueResult)
    }
    
    @IBAction func redSlider(_ sender: UISlider) {
        changeColor()
        switch sender {
        case redSlider:
            redResult.text = string(from: sender)
        case greenSlider:
            greenResult.text = string(from: sender)
        default:
            blueResult.text = string(from: sender)
        }
    }
    
    @IBAction func doneButtonPressed() {
        delegate.updateBackground(for: color)
        dismiss(animated: true)
    }
    
    
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
                redResult.text = string(from: redSlider)
            case greenResult:
                greenResult.text = string(from: greenSlider)
            default:
                blueResult.text = string(from: blueSlider)
            }
        }
        print(redResult.text ?? "", greenResult.text ?? "", blueResult.text ?? "")
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    }


extension UIColor {
    var colorValue: CIColor {
        return CIColor(color: self)
    }

    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let colorValue = self.colorValue
        return(colorValue.red, colorValue.green, colorValue.blue, colorValue.alpha)
    }
}


extension SettingsViewController {
    
    func initialViewBackground() {
        viewColor.backgroundColor = UIColor(
            red: CGFloat(color.components.red),
            green: CGFloat(color.components.green),
            blue: CGFloat(color.components.blue),
            alpha: CGFloat(color.components.alpha)
        )
    }

    func initialPositionOfSliders() {
        redSlider.value = Float(color.components.red)
        greenSlider.value = Float(color.components.green)
        blueSlider.value = Float(color.components.blue)
        print(redSlider.value, greenSlider.value, blueSlider.value)
    }

    func takeValuesOfLabels(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redResult:
                redResult.text = string(from: redSlider)
            case greenResult:
                greenResult.text = string(from: greenSlider)
            default:
                blueResult.text = string(from: blueSlider)
            }
        }
    }
}
