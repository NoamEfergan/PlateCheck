//
//  HomeVC.swift
//  PlateCheck
//
//  Created by Noam Efergan on 06/03/2023.
//

import UIKit

class HomeVC: UIViewController {
    // MARK: - Views

    private lazy var plateTextField: UITextField = {
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

    private lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = AppColours.mainColor
        button.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let loadingAlert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
    let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))


    // MARK: - Variables

    let networkService = NetworkService()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColours.background
        setupViews()
        setupAlertView()
    }

    // MARK: - Methods

    private func setupViews() {
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
            submitButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    private func setupAlertView() {
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .medium
        loadingIndicator.startAnimating();

        loadingAlert.view.addSubview(loadingIndicator)
    }

    @objc private func submitButtonTapped() {
        present(loadingAlert, animated: true)
        guard let plateNumber = plateTextField.text, !plateNumber.isEmpty else {
            loadingAlert.dismiss(animated: true) {
                self.presetError(title: "No reg", body: "If you don't give us a plate, how can we check it?")
            }
            return
        }
        Task {
            defer {
                DispatchQueue.main.async {
                    self.loadingAlert.dismiss(animated: true)
                }
            }
            do {
                let response = try await networkService.perform(
                    path: .vehicles,
                    responseType: DVLAResponse.self,
                    requestType: .POST,
                    body: ["registrationNumber": plateNumber]
                )
                print(response)
            } catch {
                print("Failed to car from reg with error: \(error.localizedDescription)")
            }
        }
    }
    
    private func presetError(title: String, body: String) {
        let alert = UIAlertController(title: title, message: body, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alert, animated: true)
    }
}
