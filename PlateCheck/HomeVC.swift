//
//  HomeVC.swift
//  PlateCheck
//
//  Created by Noam Efergan on 06/03/2023.
//

import UIKit

class HomeVC: UIViewController {
    let plateTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter plate number",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        textField.backgroundColor = AppColours.secondaryColor
        textField.textColor = .white
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = AppColours.mainColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColours.background
        setupViews()
    }

    func setupViews() {
        view.addSubview(plateTextField)
        view.addSubview(submitButton)
        NSLayoutConstraint.activate([
            plateTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            plateTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            plateTextField.widthAnchor.constraint(equalToConstant: 250),
            plateTextField.heightAnchor.constraint(equalToConstant: 50),

            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.topAnchor.constraint(equalTo: plateTextField.bottomAnchor, constant: 20),
            submitButton.widthAnchor.constraint(equalToConstant: 250),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
