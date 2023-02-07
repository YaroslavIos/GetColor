//
//  ViewController.swift
//  GetColor
//
//  Created by Ярослав Любиченко on 5.2.2023.
//

import UIKit

final class ViewController: UIViewController {

// MARK: - Setting IBOutlets
    
    @IBOutlet var viewColor: UIView!
    @IBOutlet var redResult: UILabel!
    @IBOutlet var greenResult: UILabel!
    @IBOutlet var blueResult: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColor.layer.cornerRadius = 18
        
    }

// MARK: - Setting IBActions
    
    func changeColor() {
        viewColor.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }

    @IBAction func redSliderAction() {
        changeColor()
        let roundedResult = Double(round(redSlider.value * 100) / 100)
        redResult.text = roundedResult.formatted()
    }

    @IBAction func greenSliderAction() {
        changeColor()
        let roundedResult = Double(round(greenSlider.value * 100) / 100)
        greenResult.text = roundedResult.formatted()
    }

    @IBAction func blueSliderAction() {
        changeColor()
        let roundedResult = Double(round(blueSlider.value * 100) / 100)
        blueResult.text = roundedResult.formatted()
    }
    
// MARK: - Another way solving this project
    /*
     Методом научного эксперимента я понял, что все три слайдера можно объединить в один метод и соответственно
     каждому слайдеру передавать значения.
     */
    
    
    /*
     func changeColor() {
         viewColor.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
     }
     
     
     // Подключаем redSlider, greenSlider и blueSlider к одному методу
     
     @IBAction func SliderAction() {
         changeColor()
         let roundedResult = Double(round(changedSlider.value * 100) / 100)
         sliderResult.text = roundedResult.formatted()
     }
     
     */
    }

