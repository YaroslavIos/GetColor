//
//  MainScreenViewController.swift
//  GetColor
//
//  Created by Ярослав Любиченко on 23.2.2023.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    private let color = Color.getColor()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(
            red: CGFloat(color.red),
            green: CGFloat(color.green),
            blue: CGFloat(color.blue),
            alpha: CGFloat(color.alpha)
            )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingScreenVC = segue.destination as? SettingsScreenViewController else { return }
        settingScreenVC.backgroundColor = color
    }

}
