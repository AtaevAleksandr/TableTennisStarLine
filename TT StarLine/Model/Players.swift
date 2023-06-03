//
//  Players.swift
//  TT StarLine
//
//  Created by Aleksandr Ataev on 04.06.2023.
//

import Foundation

enum LeagueType: String {
    case lite = "Lite"
    case hard = "Hard"
}

struct Player {
    var firstName: String
    var lastName: String
    var league: LeagueType

    static var players: [Player] = [Player(firstName: "Александр",  lastName: "Атаев",       league: .hard),
                                    Player(firstName: "Олег",       lastName: "Басосов",     league: .hard),
                                    Player(firstName: "Наталья",    lastName: "Гуревич",     league: .hard),
                                    Player(firstName: "Александр",  lastName: "Конкин",      league: .hard),
                                    Player(firstName: "Игорь",      lastName: "Ловкет",      league: .hard),
                                    Player(firstName: "Максим",     lastName: "Юпатов",      league: .hard),
                                    Player(firstName: "Сергей",     lastName: "Смертьев",    league: .hard),

                                    Player(firstName: "Юрий",       lastName: "Буров",       league: .lite),
                                    Player(firstName: "Дмитрий",    lastName: "Гарифуллин",  league: .lite),
                                    Player(firstName: "Андрей",     lastName: "Дмитриев",    league: .lite),
                                    Player(firstName: "Сергей",     lastName: "Жижанов",     league: .lite),
                                    Player(firstName: "Дмитрий",    lastName: "Карпов",      league: .lite),
                                    Player(firstName: "Руслан",     lastName: "Касимовский", league: .lite),
                                    Player(firstName: "Иван",       lastName: "Куприянов",   league: .lite),
                                    Player(firstName: "Вячеслав",   lastName: "Куприянов",   league: .lite),
                                    Player(firstName: "Константин", lastName: "Лазутин",     league: .lite),
                                    Player(firstName: "Дмитрий",    lastName: "Королев",     league: .lite)
    ]
}

