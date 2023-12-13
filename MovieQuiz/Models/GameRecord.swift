//
//  GameRecord.swift
//  MovieQuiz
//
//  Created by Дмитрий Ивашинин on 12.12.2023.
//

import Foundation

struct GameRecord: Codable {
    let correct: Int
    let total: Int
    let date: Date
    
    func isBetterThan(_ another: GameRecord) -> Bool{
        another.correct < correct
    }
}
