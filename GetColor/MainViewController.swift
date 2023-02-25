//
//  MainScreenViewController.swift
//  GetColor
//
//  Created by Ярослав Любиченко on 23.2.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func updateBackground(for color: UIColor)
}

final class MainViewController: UIViewController {
    
    var color = UIColor(
        red: 0.5,
        green: 0.4,
        blue: 1,
        alpha: 1
        )

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingsViewController else { return }
        settingVC.color = view.backgroundColor
        settingVC.delegate = self
    }
}


extension MainViewController: SettingsViewControllerDelegate {
    func updateBackground(for color: UIColor) {
        view.backgroundColor = color
    }
}
