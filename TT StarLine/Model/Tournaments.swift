//
//  Tournaments.swift
//  TT StarLine
//
//  Created by Aleksandr Ataev on 14.07.2023.
//

import Foundation

struct Tournament: Equatable {
    var name: String
    var countOfPlayers: Int
}

extension Tournament {
    static var tournaments: [Tournament] = [
        Tournament(name: "Зимний турнир 2023 г.", countOfPlayers: 20),
        Tournament(name: "Весенний турнир 2023 г.", countOfPlayers: 15),
        Tournament(name: "Летний турнир 2023 г.", countOfPlayers: 30),
        Tournament(name: "Осенний турнир 2023 г.", countOfPlayers: 24)
    ]
}
