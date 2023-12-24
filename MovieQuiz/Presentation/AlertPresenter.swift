//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Дмитрий Ивашинин on 28.11.2023.
//

import UIKit

class AlertPresenter {
    weak var delegate: UIViewController?
    init(delegate: UIViewController? = nil) {
        self.delegate = delegate
    }
}

extension AlertPresenter: AlertPresenterProtocol {
    func show(alertModel: AlertModel) {
        let alert = UIAlertController(
            title: alertModel.title,
            message: alertModel.message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: alertModel.buttonText, style: .default) { _ in
            
            alertModel.buttonAction()
            
        }
        alert.addAction(action)
        delegate?.present(alert, animated: true)
    }
}

