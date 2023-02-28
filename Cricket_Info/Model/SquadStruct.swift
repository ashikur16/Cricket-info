//
//  SquadStruct.swift
//  Cricket_Info
//
//  Created by bjit on 13/2/23.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Squad: Codable {
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let resource: String?
    let id, leagueID, seasonID, stageID: Int?
    let round: String?
    let localteam_id, visitorteam_id: Int?
    let startingAt, type: String?
    let live: Bool?
    let status: String?
    let note: String?
    let venueID, tossWonTeamID, winnerTeamID: Int?
    let firstUmpireID, secondUmpireID, tvUmpireID, refereeID: Int?
    let manOfMatchID: Int?
    let elected: String?
    let superOver, followOn: Bool?
    let lineup: [LineupElement]?
}

// MARK: - LineupElement
struct LineupElement: Codable {
    let id: Int?
    let fullname: String?
    let image_path: String?
    let updatedAt: String?
    let lineup: LineupLineup?
}

// MARK: - LineupLineup
struct LineupLineup: Codable {
    let team_id: Int?
    let captain, wicketkeeper, substitution: Bool?
}

