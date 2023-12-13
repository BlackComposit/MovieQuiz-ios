//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Дмитрий Ивашинин on 11.12.2023.
//

import Foundation

protocol StatisticService {
    var totalAccuracy: Double { get }
    var gamesCount: Int { get }
    var bestGame: GameRecord { get }
    
    func store(correct count: Int, total amount: Int) 
}
