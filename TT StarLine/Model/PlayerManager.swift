//
//  PlayerManager.swift
//  TT StarLine
//
//  Created by Aleksandr Ataev on 03.07.2023.
//

import Foundation

final class PlayerManager {
    static let shared = PlayerManager()

    var players = Player.players.sorted { $0.lastName.localizedCaseInsensitiveCompare($1.lastName) == .orderedAscending }

    private init() {}

    func addPlayer(_ player: Player) {
        let index = players.firstIndex { $0.lastName.localizedCaseInsensitiveCompare(player.lastName) == .orderedDescending } ?? players.count
        players.insert(player, at: index)
    }

    func getPlayers() -> [Player] {
        return players
    }

    func updatePlayers(with newPlayers: [Player]) {
        players = newPlayers
    }
}
