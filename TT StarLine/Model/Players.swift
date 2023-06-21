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
    var rating: Int
}

extension Player {
    static var players: [Player] = [
        Player(avatar: .male, age: 18, firstName: "Григорий", lastName: "Сотиков", manufacture: "Склад д. Суоранда",
               contactData: "+7(921)988-48-50", league: .light, rating: 50),
        Player(avatar: .male, age: 18, firstName: "Юрий", lastName: "Буров", manufacture: "Склад д. Суоранда",
               contactData: "+7(911)171-69-03", league: .light, rating: 60),
        Player(avatar: .male, age: 18, firstName: "Вячеслав", lastName: "Куприянов", manufacture: "Победит 2",
               contactData: "+7(981)739-31-98", league: .light, rating: 55),
        Player(avatar: .male, age: 18, firstName: "Иван", lastName: "Куприянов", manufacture: "Победит 2",
               contactData: "+7(911)122-82-83", league: .light, rating: 55),
        Player(avatar: .male, age: 18, firstName: "Константин", lastName: "Лазутин", manufacture: "Победит 5",
               contactData: "+7(911)951-28-33", league: .light, rating: 65),
        Player(avatar: .male, age: 18, firstName: "Максим", lastName: "Юпатов", manufacture: "Победит 3",
               contactData: "+7(921)437-94-11", league: .hard, rating: 85),
        Player(avatar: .male, age: 18, firstName: "Игорь", lastName: "Ловкет", manufacture: "Победит 2",
               contactData: "+7(967)510-75-46", league: .hard, rating: 80),
        Player(avatar: .male, age: 18, firstName: "Александр", lastName: "Конкин", manufacture: "Победит 2",
               contactData: "+7(921)588-23-57", league: .hard, rating: 75),
        Player(avatar: .female, age: 18, firstName: "Наталья", lastName: "Гуревич", manufacture: "Победит 2",
               contactData: "+7(921)406-44-70", league: .hard, rating: 100),
        Player(avatar: .male, age: 18, firstName: "Дмитрий", lastName: "Карпов", manufacture: "Победит 2",
               contactData: "+7(900)643-64-56", league: .light, rating: 60),
        Player(avatar: .male, age: 18, firstName: "Дмитрий", lastName: "Королев", manufacture: "Победит 5",
               contactData: "+7(911)163-01-11", league: .light, rating: 55),
        Player(avatar: .male, age: 18, firstName: "Руслан", lastName: "Касимовский", manufacture: "Победит 2",
               contactData: "+7(950)726-79-98", league: .light, rating: 55),
        Player(avatar: .male, age: 18, firstName: "Александр", lastName: "Гущин", manufacture: "Победит 5",
               contactData: "+7(981)752-40-35", league: .light, rating: 50),
        Player(avatar: .male, age: 18, firstName: "Валерий", lastName: "Кузнецов", manufacture: "Победит 2",
               contactData: "+7(981)706-01-11", league: .light, rating: 50),
        Player(avatar: .male, age: 18, firstName: "Сергей", lastName: "Смертьев", manufacture: "Победит 5",
               contactData: "+7(904)333-53-92", league: .hard, rating: 95),
        Player(avatar: .male, age: 18, firstName: "Андрей", lastName: "Дмитриев", manufacture: "Победит 5",
               contactData: "+7(951)670-37-03", league: .hard, rating: 65),
        Player(avatar: .male, age: 18, firstName: "Олег", lastName: "Басосов", manufacture: "Победит 5",
               contactData: "+7(921)960-74-24", league: .hard, rating: 70),
        Player(avatar: .male, age: 29, firstName: "Александр", lastName: "Атаев", manufacture: "Победит 5",
               contactData: "+7(999)669-12-59", league: .hard, rating: 90)
    ]
}

