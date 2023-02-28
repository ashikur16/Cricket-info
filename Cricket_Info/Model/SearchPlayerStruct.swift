//
//  SearchPlayerViewModel.swift
//  Cricket_Info
//
//  Created by bjit on 19/2/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Player: Codable {
    let data: [DatumPlayer]?
}

// MARK: - Datum
struct DatumPlayer: Codable {
    let id: Int?
    let fullname: String?
    let image_path: String?
    let updatedAt: String?
}

