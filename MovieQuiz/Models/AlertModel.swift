//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Дмитрий Ивашинин on 28.11.2023.
//

import Foundation

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let buttonAction: () -> Void
}
