//
//  ViewController.swift
//  GetColor
//
//  Created by Ярослав Любиченко on 5.2.2023.
//

import UIKit

final class SettingsScreenViewController: UIViewController {

    // MARK: - Setting IBOutlets
    
    @IBOutlet var viewColor: UIView!
    
    @IBOutlet var redResult: UILabel!
    @IBOutlet var greenResult: UILabel!
    @IBOutlet var blueResult: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var backgroundColor: Color!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColor.layer.cornerRadius = 18
        
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
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    }

extension SettingsScreenViewController {
    
// MARK - Takes a values from a main screen for a view
    
    func initialViewBackground() {
        viewColor.backgroundColor = UIColor(
            red: CGFloat(backgroundColor.red),
            green: CGFloat(backgroundColor.green),
            blue: CGFloat(backgroundColor.blue),
            alpha: CGFloat(backgroundColor.alpha)
        )
    }
    
    func initialPositionOfSliders() {
        redSlider.value = backgroundColor.red
        greenSlider.value = backgroundColor.green
        blueSlider.value = backgroundColor.blue
    }
    
    func takeValuesOfLabels(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redResult:
                redResult.text = String(backgroundColor.red)
            case greenResult:
                greenResult.text = String(backgroundColor.green)
            default:
                blueResult.text = String(backgroundColor.blue)
            }
        }
    }
}
