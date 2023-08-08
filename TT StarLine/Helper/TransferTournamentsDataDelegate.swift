//
//  TransferTournamentsDataDelegate.swift
//  TT StarLine
//
//  Created by Aleksandr Ataev on 14.07.2023.
//

import Foundation

protocol TransferTournamentsDataDelegate: AnyObject {
    func didAdd(the tournament: Tournament)
}
