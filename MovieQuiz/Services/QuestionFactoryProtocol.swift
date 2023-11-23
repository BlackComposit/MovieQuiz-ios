//
//  QuestionFactoryProtocol.swift
//  MovieQuiz
//
//  Created by Дмитрий Ивашинин on 24.11.2023.
//

import Foundation

protocol QuestionFactoryProtocol {
    func requestNextQuestion() -> QuizQuestion?
} 
