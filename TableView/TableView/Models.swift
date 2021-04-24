//
//  Models.swift
//  TableView
//
//  Created by Ekin Celebi on 24.04.2021.
//

import Foundation

struct Result: Codable {
    let results: [ResultItem]
}

struct ResultItem: Codable {
    let timestamp: String
    let latitude: Float
    let longitude: Float
    let depth: Float
    let size: Float
    let quality: Float
    let humanReadableLocation: String
}

