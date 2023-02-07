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
    
    //MARK: - Setting IBAction
    
    func changeColor() {
        viewColor.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    // Подключаем redSlider, greenSlider и blueSlider к одному методу
    
    @IBAction func SliderAction() {
        changeColor()
        
        let redRoundedResult = Double(round(redSlider.value * 100) / 100)
        redResult.text = redRoundedResult.formatted()
        
        let greenRoundedResult = Double(round(greenSlider.value * 100) / 100)
        greenResult.text = greenRoundedResult.formatted()
        
        let blueRoundedResult = Double(round(blueSlider.value * 100) / 100)
        blueResult.text = blueRoundedResult.formatted()
    }

    // MARK: - The first way of resolving this homework
    // Каждому UISlider прописывал свой собственный метод)
 
    /*
     func changeColor() {
     viewColor.backgroundColor = UIColor(
     red: CGFloat(redSlider.value),
     green: CGFloat(greenSlider.value),
     blue: CGFloat(blueSlider.value),
     alpha: 1
     )
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
     */
    }

