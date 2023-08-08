//
//  TransferPlayersDataDelegate.swift
//  TT StarLine
//
//  Created by Aleksandr Ataev on 03.07.2023.
//

import Foundation

protocol TransferPlayersDataDelegate: AnyObject {
    func didAdd(the player: Player)
}
