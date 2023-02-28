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
