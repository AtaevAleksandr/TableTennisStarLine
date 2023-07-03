//
//  Players.swift
//  TT StarLine
//
//  Created by Aleksandr Ataev on 04.06.2023.
//

import Foundation

enum LeagueType: String, CaseIterable {
    case light = "Лайт"
    case hard = "Хард"
}

enum GenderAvatar: String, CaseIterable {
    case male = "Мужской"
    case female = "Женский"
}

struct Player: Equatable {

    var avatar: GenderAvatar
    var age: Int
    var lastName: String
    var firstName: String
    var manufacture: String
    var contactData: String
    var league: LeagueType
    var rating: Int
}

extension Player {
    static var players: [Player] = [
        Player(avatar: .male, age: 18, lastName: "Сотиков", firstName: "Григорий", manufacture: "Склад д. Суоранда",
               contactData: "+7(921)988-48-50", league: .light, rating: 50),
        Player(avatar: .male, age: 18, lastName: "Буров", firstName: "Юрий", manufacture: "Склад д. Суоранда",
               contactData: "+7(911)171-69-03", league: .light, rating: 60),
        Player(avatar: .male, age: 18, lastName: "Куприянов", firstName: "Вячеслав", manufacture: "Победит 2",
               contactData: "+7(981)739-31-98", league: .light, rating: 55),
        Player(avatar: .male, age: 18, lastName: "Куприянов", firstName: "Иван", manufacture: "Победит 2",
               contactData: "+7(911)122-82-83", league: .light, rating: 55),
        Player(avatar: .male, age: 18, lastName: "Лазутин", firstName: "Константин", manufacture: "Победит 5",
               contactData: "+7(911)951-28-33", league: .light, rating: 65),
        Player(avatar: .male, age: 18, lastName: "Юпатов", firstName: "Максим", manufacture: "Победит 3",
               contactData: "+7(921)437-94-11", league: .hard, rating: 85),
        Player(avatar: .male, age: 18, lastName: "Ловкет", firstName: "Игорь", manufacture: "Победит 2",
               contactData: "+7(967)510-75-46", league: .hard, rating: 80),
        Player(avatar: .male, age: 18, lastName: "Конкин", firstName: "Александр", manufacture: "Победит 2",
               contactData: "+7(921)588-23-57", league: .hard, rating: 75),
        Player(avatar: .female, age: 18, lastName: "Гуревич", firstName: "Наталья", manufacture: "Победит 2",
               contactData: "+7(921)406-44-70", league: .hard, rating: 100),
        Player(avatar: .male, age: 18, lastName: "Карпов", firstName: "Дмитрий", manufacture: "Победит 2",
               contactData: "+7(900)643-64-56", league: .light, rating: 60),
        Player(avatar: .male, age: 18, lastName: "Королев", firstName: "Дмитрий", manufacture: "Победит 5",
               contactData: "+7(911)163-01-11", league: .light, rating: 55),
        Player(avatar: .male, age: 18, lastName: "Касимовский", firstName: "Руслан", manufacture: "Победит 2",
               contactData: "+7(950)726-79-98", league: .light, rating: 55),
        Player(avatar: .male, age: 18, lastName: "Гущин", firstName: "Александр", manufacture: "Победит 5",
               contactData: "+7(981)752-40-35", league: .light, rating: 50),
        Player(avatar: .male, age: 18, lastName: "Кузнецов", firstName: "Валерий", manufacture: "Победит 2",
               contactData: "+7(981)706-01-11", league: .light, rating: 50),
        Player(avatar: .male, age: 18, lastName: "Смертьев", firstName: "Сергей", manufacture: "Победит 5",
               contactData: "+7(904)333-53-92", league: .hard, rating: 95),
        Player(avatar: .male, age: 18, lastName: "Дмитриев", firstName: "Андрей", manufacture: "Победит 5",
               contactData: "+7(951)670-37-03", league: .hard, rating: 65),
        Player(avatar: .male, age: 18, lastName: "Басосов", firstName: "Олег", manufacture: "Победит 5",
               contactData: "+7(921)960-74-24", league: .hard, rating: 70),
        Player(avatar: .male, age: 29, lastName: "Атаев", firstName: "Александр", manufacture: "Победит 5",
               contactData: "+7(999)669-12-59", league: .hard, rating: 90)
    ]
}

