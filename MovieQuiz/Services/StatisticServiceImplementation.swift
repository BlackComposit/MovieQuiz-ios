//
//  StatisticServiceImplementation.swift
//  MovieQuiz
//
//  Created by Дмитрий Ивашинин on 12.12.2023.
//

import Foundation

final class StatisticServiceImplementation: StatisticService {
    private enum Keys: String, CaseIterable {
        case correct, total, bestGame, gamesCount
    }
    
    
    private let userDefaults = UserDefaults.standard
    
    var totalAccuracy: Double {
        get {
            Double(correct) / Double(total) * 100
        }
    }
    
    var correct: Int {
        get {
            userDefaults.integer(forKey: Keys.correct.rawValue)
        }
        
        set {
            userDefaults.set(newValue, forKey: Keys.correct.rawValue)
        }
    }
    
    var total: Int {
        get {
            userDefaults.integer(forKey: Keys.total.rawValue)
        }
        
        set {
            userDefaults.set(newValue, forKey: Keys.total.rawValue)
        }
    }
    
    var gamesCount: Int {
        get {
            userDefaults.integer(forKey: Keys.gamesCount.rawValue)
        }
        
        set {
            userDefaults.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
    
    var bestGame: GameRecord {
        get {
            guard let data = userDefaults.data(forKey: Keys.bestGame.rawValue),
                  let record = try? JSONDecoder().decode(GameRecord.self, from: data) else {
                return .init(correct: 0, total: 0, date: Date())
            }
            return record
        }
        
        set {
            guard let data = try? JSONEncoder().encode(newValue) else {
                print("Невозможно сохранить результат")
                return
            }
            
            userDefaults.set(data, forKey: Keys.bestGame.rawValue)
        }
    }
    
    func store(correct count: Int, total amount: Int) {
        gamesCount += 1
        correct += count
        total += amount
        
        let gameRec = GameRecord(correct: count, total: amount, date: Date())
        guard gameRec.isBetterThan(GameRecord(correct: bestGame.correct, total: bestGame.total, date: bestGame.date)) else {
            print("Эта игра не лучше предыдущей")
            return }
        
        guard let data = try? JSONEncoder().encode(gameRec) else {
            print("Не удалось декодировать данные в функции store")
            return
        }
        
        userDefaults.set(data, forKey: Keys.bestGame.rawValue)
    }
}
