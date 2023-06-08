//
//  Players.swift
//  TT StarLine
//
//  Created by Aleksandr Ataev on 04.06.2023.
//

import Foundation

enum LeagueType: String {
    case light = "Light"
    case hard = "Hard"
}

enum GenderAvatar: String {
    case male = "Male"
    case female = "Female"
}

struct Player {
    var avatar: GenderAvatar
    var age: Int
    var firstName: String
    var lastName: String
    var manufacture: String
    var contactData: String
    var league: LeagueType
}

extension Player {
    static var players: [Player] = [
        Player(avatar: .male, age: 29, firstName: "Александр", lastName: "Атаев", manufacture: "Победит 5",
               contactData: "+79996691259", league: .hard),
        Player(avatar: .male, age: 4, firstName: "Олег", lastName: "Басосов", manufacture: "Победит 5",
               contactData: "+79996691259", league: .hard),
        Player(avatar: .female, age: 4, firstName: "Наталья", lastName: "Гуревич", manufacture: "Победит 2",
               contactData: "+79996691259", league: .hard),
        Player(avatar: .male, age: 4, firstName: "Александр", lastName: "Конкин", manufacture: "Победит 2",
               contactData: "+79996691259", league: .hard),
        Player(avatar: .male, age: 4, firstName: "Игорь", lastName: "Ловкет", manufacture: "Победит 2",
               contactData: "+79996691259", league: .hard),
        Player(avatar: .male, age: 4, firstName: "Максим", lastName: "Юпатов", manufacture: "Победит 4",
               contactData: "+79996691259", league: .hard),
        Player(avatar: .male, age: 4, firstName: "Сергей", lastName: "Смертьев", manufacture: "Победит 5",
               contactData: "+79996691259", league: .hard),

        Player(avatar: .male, age: 4, firstName: "Юрий", lastName: "Буров", manufacture: "Победит 2",
               contactData: "+79996691259", league: .light),
        Player(avatar: .male, age: 4, firstName: "Дмитрий", lastName: "Гарифуллин", manufacture: "Победит 5",
               contactData: "+79996691259", league: .light),
        Player(avatar: .male, age: 4, firstName: "Андрей", lastName: "Дмитриев", manufacture: "Победит 5",
               contactData: "+79996691259", league: .light),
        Player(avatar: .male, age: 4, firstName: "Сергей", lastName: "Жижанов", manufacture: "Победит 5",
               contactData: "+79996691259", league: .light),
        Player(avatar: .male, age: 4, firstName: "Дмитрий", lastName: "Карпов", manufacture: "Победит 2",
               contactData: "+79996691259", league: .light),
        Player(avatar: .male, age: 4, firstName: "Руслан", lastName: "Касимовский", manufacture: "Победит 2",
               contactData: "+79996691259", league: .light),
        Player(avatar: .male, age: 4, firstName: "Иван", lastName: "Куприянов", manufacture: "Победит 2",
               contactData: "+79996691259", league: .light),
        Player(avatar: .male, age: 4, firstName: "Вячеслав", lastName: "Куприянов", manufacture: "Победит 2",
               contactData: "+79996691259", league: .light),
        Player(avatar: .male, age: 4, firstName: "Константин", lastName: "Лазутин", manufacture: "Победит 5",
               contactData: "+79996691259", league: .light),
        Player(avatar: .male, age: 4, firstName: "Дмитрий", lastName: "Королев", manufacture: "Победит 5",
               contactData: "+79996691259", league: .light)
    ]
}

