//
//  Players.swift
//  TT StarLine
//
//  Created by Aleksandr Ataev on 04.06.2023.
//

import Foundation
import UIKit

enum LeagueType: String, CaseIterable {
    case unknown = "Не выбрана"
    case light = "Лайт"
    case hard = "Хард"
}

enum GenderAvatar: String, CaseIterable {
    case unknown = "Не выбран"
    case male = "Мужской"
    case female = "Женский"

    var image: UIImage? {
        if self == .unknown {
            return UIImage(systemName: "person.circle")
        }
        return nil
    }
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
               contactData: "+7(999)999-99-99", league: .light, rating: 50),
        Player(avatar: .male, age: 18, lastName: "Буров", firstName: "Юрий", manufacture: "Склад д. Суоранда",
               contactData: "+7(999)999-99-99", league: .light, rating: 60),
        Player(avatar: .male, age: 18, lastName: "Куприянов", firstName: "Вячеслав", manufacture: "Победит 2",
               contactData: "+7(999)999-99-99", league: .light, rating: 55),
        Player(avatar: .male, age: 18, lastName: "Куприянов", firstName: "Иван", manufacture: "Победит 2",
               contactData: "+7(999)999-99-99", league: .light, rating: 55),
        Player(avatar: .male, age: 18, lastName: "Лазутин", firstName: "Константин", manufacture: "Победит 5",
               contactData: "+7(999)999-99-99", league: .light, rating: 65),
        Player(avatar: .male, age: 18, lastName: "Юпатов", firstName: "Максим", manufacture: "Победит 3",
               contactData: "+7(999)999-99-99", league: .hard, rating: 85),
        Player(avatar: .male, age: 18, lastName: "Ловкет", firstName: "Игорь", manufacture: "Победит 2",
               contactData: "+7(999)999-99-99", league: .hard, rating: 80),
        Player(avatar: .male, age: 18, lastName: "Конкин", firstName: "Александр", manufacture: "Победит 2",
               contactData: "+7(999)999-99-99", league: .hard, rating: 75),
        Player(avatar: .female, age: 18, lastName: "Гуревич", firstName: "Наталья", manufacture: "Победит 2",
               contactData: "+7(999)999-99-99", league: .hard, rating: 100),
        Player(avatar: .male, age: 18, lastName: "Карпов", firstName: "Дмитрий", manufacture: "Победит 2",
               contactData: "+7(999)999-99-99", league: .light, rating: 60),
        Player(avatar: .male, age: 18, lastName: "Королев", firstName: "Дмитрий", manufacture: "Победит 5",
               contactData: "+7(999)999-99-99", league: .light, rating: 55),
        Player(avatar: .male, age: 18, lastName: "Касимовский", firstName: "Руслан", manufacture: "Победит 2",
               contactData: "+7(999)999-99-99", league: .light, rating: 55),
        Player(avatar: .male, age: 18, lastName: "Гущин", firstName: "Александр", manufacture: "Победит 5",
               contactData: "+7(999)999-99-99", league: .light, rating: 50),
        Player(avatar: .male, age: 18, lastName: "Кузнецов", firstName: "Валерий", manufacture: "Победит 2",
               contactData: "+7(999)999-99-99", league: .light, rating: 50),
        Player(avatar: .male, age: 18, lastName: "Смертьев", firstName: "Сергей", manufacture: "Победит 5",
               contactData: "+7(999)999-99-99", league: .hard, rating: 95),
        Player(avatar: .male, age: 18, lastName: "Дмитриев", firstName: "Андрей", manufacture: "Победит 5",
               contactData: "+7(999)999-99-99", league: .hard, rating: 65),
        Player(avatar: .male, age: 18, lastName: "Басосов", firstName: "Олег", manufacture: "Победит 5",
               contactData: "+7(999)999-99-99", league: .hard, rating: 70),
        Player(avatar: .male, age: 29, lastName: "Атаев", firstName: "Александр", manufacture: "Победит 5",
               contactData: "+7(999)999-99-99", league: .hard, rating: 90)
    ]
}

