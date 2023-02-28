////
////  MatchStruct.swift
////  Cricket_Info
////
////  Created by bjit on 9/2/23.
////
//
//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)
//
//import Foundation
//
//// MARK: - Welcome
//struct Welcome: Codable {
//    let data: [Datum]?
//    let links: Links?
//    let meta: Meta?
//}
//
//// MARK: - Datum
//struct Datum: Codable {
//    let resource: DatumResource?
//    let id, leagueID, seasonID, stageID: Int?
//    let round: String?
//    let localteamID, visitorteamID: Int?
//    let startingAt: String?
//    let type: DatumType?
//    let live: Bool?
//    let status: Status?
//    let lastPeriod: JSONNull?
//    let note: String?
//    let venueID, tossWonTeamID: Int?
//    let winnerTeamID: Int?
//    let drawNoresult: String?
//    let firstUmpireID, secondUmpireID, tvUmpireID, refereeID: Int?
//    let manOfMatchID, manOfSeriesID, totalOversPlayed: Int?
//    let elected: Elected?
//    let superOver, followOn: Bool?
//    let localteamDLData, visitorteamDLData: TeamDLData?
//    let rpcOvers, rpcTarget: String?
//    let weatherReport: [JSONAny]?
//    let league: League?
//    let localteam, visitorteam: Team?
//    let runs: [Run]?
//    let stage: League?
//
//    enum CodingKeys: String, CodingKey {
//        case resource, id
//        case leagueID = "league_id"
//        case seasonID = "season_id"
//        case stageID = "stage_id"
//        case round
//        case localteamID = "localteam_id"
//        case visitorteamID = "visitorteam_id"
//        case startingAt = "starting_at"
//        case type, live, status
//        case lastPeriod = "last_period"
//        case note
//        case venueID = "venue_id"
//        case tossWonTeamID = "toss_won_team_id"
//        case winnerTeamID = "winner_team_id"
//        case drawNoresult = "draw_noresult"
//        case firstUmpireID = "first_umpire_id"
//        case secondUmpireID = "second_umpire_id"
//        case tvUmpireID = "tv_umpire_id"
//        case refereeID = "referee_id"
//        case manOfMatchID = "man_of_match_id"
//        case manOfSeriesID = "man_of_series_id"
//        case totalOversPlayed = "total_overs_played"
//        case elected
//        case superOver = "super_over"
//        case followOn = "follow_on"
//        case localteamDLData = "localteam_dl_data"
//        case visitorteamDLData = "visitorteam_dl_data"
//        case rpcOvers = "rpc_overs"
//        case rpcTarget = "rpc_target"
//        case weatherReport = "weather_report"
//        case league, localteam, visitorteam, runs, stage
//    }
//}
//
//enum Elected: String, Codable {
//    case batting = "batting"
//    case bowling = "bowling"
//}
//
//// MARK: - League
//struct League: Codable {
//    let resource: LeagueResource?
//    let id, seasonID, countryID: Int?
//    let name: Name?
//    let code: Code?
//    let imagePath: String?
//    let type: LeagueType?
//    let updatedAt: UpdatedAt?
//    let leagueID: Int?
//    let standings: Bool?
//
//    enum CodingKeys: String, CodingKey {
//        case resource, id
//        case seasonID = "season_id"
//        case countryID = "country_id"
//        case name, code
//        case imagePath = "image_path"
//        case type
//        case updatedAt = "updated_at"
//        case leagueID = "league_id"
//        case standings
//    }
//}
//
//enum Code: String, Codable {
//    case bbl = "BBL"
//    case inz = "INZ"
//    case iz = "IZ"
//    case nzi = "NZI"
//    case po = "PO"
//    case rs = "RS"
//    case rt = "RT"
//    case sli = "SLI"
//    case t20C = "T20C"
//    case t20I = "T20I"
//}
//
//enum Name: String, Codable {
//    case bigBashLeague = "Big Bash League"
//    case csaT20Challenge = "CSA T20 Challenge"
//    case indiaTourOfNewZealand = "India tour of New Zealand"
//    case irelandTourOfZimbabwe = "Ireland tour of Zimbabwe"
//    case newZealandTourOfIndia = "New Zealand tour of India"
//    case playOffs = "Play Offs"
//    case regularSeason = "Regular Season"
//    case rwandaTourOfTanzania = "Rwanda tour of Tanzania"
//    case sriLankaTourOfIndia = "Sri Lanka tour of India"
//    case twenty20International = "Twenty20 International"
//}
//
//enum LeagueResource: String, Codable {
//    case leagues = "leagues"
//    case stages = "stages"
//}
//
//enum LeagueType: String, Codable {
//    case league = "league"
//    case phase = "phase"
//}
//
//enum UpdatedAt: String, Codable {
//    case the20220703T120937000000Z = "2022-07-03T12:09:37.000000Z"
//    case the20220708T201538000000Z = "2022-07-08T20:15:38.000000Z"
//    case the20220708T201551000000Z = "2022-07-08T20:15:51.000000Z"
//    case the20220918T150959000000Z = "2022-09-18T15:09:59.000000Z"
//    case the20220918T152248000000Z = "2022-09-18T15:22:48.000000Z"
//    case the20220918T152259000000Z = "2022-09-18T15:22:59.000000Z"
//    case the20221029T195151000000Z = "2022-10-29T19:51:51.000000Z"
//    case the20221211T101250000000Z = "2022-12-11T10:12:50.000000Z"
//    case the20221211T101956000000Z = "2022-12-11T10:19:56.000000Z"
//    case the20221211T102712000000Z = "2022-12-11T10:27:12.000000Z"
//    case the20221229T122645000000Z = "2022-12-29T12:26:45.000000Z"
//    case the20230108T112825000000Z = "2023-01-08T11:28:25.000000Z"
//}
//
//// MARK: - Team
//struct Team: Codable {
//    let resource: LocalteamResource?
//    let id: Int?
//    let name: String?
//    let imagePath: String?
//    let updatedAt: String?
//
//    enum CodingKeys: String, CodingKey {
//        case resource, id, name
//        case imagePath = "image_path"
//        case updatedAt = "updated_at"
//    }
//}
//
//enum LocalteamResource: String, Codable {
//    case teams = "teams"
//}
//
//// MARK: - TeamDLData
//struct TeamDLData: Codable {
//    let score, overs, wicketsOut: String?
//
//    enum CodingKeys: String, CodingKey {
//        case score, overs
//        case wicketsOut = "wickets_out"
//    }
//}
//
//enum DatumResource: String, Codable {
//    case fixtures = "fixtures"
//}
//
//// MARK: - Run
//struct Run: Codable {
//    let resource: RunResource?
//    let id, fixtureID, teamID, inning: Int?
//    let score, wickets: Int?
//    let overs: Double?
//    let pp1: Pp1?
//    let pp2: String?
//    let pp3: JSONNull?
//    let updatedAt: String?
//
//    enum CodingKeys: String, CodingKey {
//        case resource, id
//        case fixtureID = "fixture_id"
//        case teamID = "team_id"
//        case inning, score, wickets, overs, pp1, pp2, pp3
//        case updatedAt = "updated_at"
//    }
//}
//
//enum Pp1: String, Codable {
//    case the13 = "1-3"
//    case the14 = "1-4"
//    case the15 = "1-5"
//    case the16 = "1-6"
//}
//
//enum RunResource: String, Codable {
//    case runs = "runs"
//}
//
//enum Status: String, Codable {
//    case finished = "Finished"
//}
//
//enum DatumType: String, Codable {
//    case t20 = "T20"
//    case t20I = "T20I"
//}
//
//// MARK: - Links
//struct Links: Codable {
//    let first, last: String?
//    let prev: JSONNull?
//    let next: String?
//}
//
//// MARK: - Meta
//struct Meta: Codable {
//    let currentPage, from, lastPage: Int?
//    let links: [Link]?
//    let path: String?
//    let perPage, to, total: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case currentPage = "current_page"
//        case from
//        case lastPage = "last_page"
//        case links, path
//        case perPage = "per_page"
//        case to, total
//    }
//}
//
//// MARK: - Link
//struct Link: Codable {
//    let url: String?
//    let label: String?
//    let active: Bool?
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
//
//class JSONCodingKey: CodingKey {
//    let key: String
//
//    required init?(intValue: Int) {
//        return nil
//    }
//
//    required init?(stringValue: String) {
//        key = stringValue
//    }
//
//    var intValue: Int? {
//        return nil
//    }
//
//    var stringValue: String {
//        return key
//    }
//}
//
//class JSONAny: Codable {
//
//    let value: Any
//
//    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
//        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
//        return DecodingError.typeMismatch(JSONAny.self, context)
//    }
//
//    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
//        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
//        return EncodingError.invalidValue(value, context)
//    }
//
//    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if container.decodeNil() {
//            return JSONNull()
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if let value = try? container.decodeNil() {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer() {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
//        if let value = try? container.decode(Bool.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Double.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(String.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decodeNil(forKey: key) {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
//        var arr: [Any] = []
//        while !container.isAtEnd {
//            let value = try decode(from: &container)
//            arr.append(value)
//        }
//        return arr
//    }
//
//    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
//        var dict = [String: Any]()
//        for key in container.allKeys {
//            let value = try decode(from: &container, forKey: key)
//            dict[key.stringValue] = value
//        }
//        return dict
//    }
//
//    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
//        for value in array {
//            if let value = value as? Bool {
//                try container.encode(value)
//            } else if let value = value as? Int64 {
//                try container.encode(value)
//            } else if let value = value as? Double {
//                try container.encode(value)
//            } else if let value = value as? String {
//                try container.encode(value)
//            } else if value is JSONNull {
//                try container.encodeNil()
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer()
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
//        for (key, value) in dictionary {
//            let key = JSONCodingKey(stringValue: key)!
//            if let value = value as? Bool {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Int64 {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Double {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? String {
//                try container.encode(value, forKey: key)
//            } else if value is JSONNull {
//                try container.encodeNil(forKey: key)
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer(forKey: key)
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
//        if let value = value as? Bool {
//            try container.encode(value)
//        } else if let value = value as? Int64 {
//            try container.encode(value)
//        } else if let value = value as? Double {
//            try container.encode(value)
//        } else if let value = value as? String {
//            try container.encode(value)
//        } else if value is JSONNull {
//            try container.encodeNil()
//        } else {
//            throw encodingError(forValue: value, codingPath: container.codingPath)
//        }
//    }
//
//    public required init(from decoder: Decoder) throws {
//        if var arrayContainer = try? decoder.unkeyedContainer() {
//            self.value = try JSONAny.decodeArray(from: &arrayContainer)
//        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
//            self.value = try JSONAny.decodeDictionary(from: &container)
//        } else {
//            let container = try decoder.singleValueContainer()
//            self.value = try JSONAny.decode(from: container)
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        if let arr = self.value as? [Any] {
//            var container = encoder.unkeyedContainer()
//            try JSONAny.encode(to: &container, array: arr)
//        } else if let dict = self.value as? [String: Any] {
//            var container = encoder.container(keyedBy: JSONCodingKey.self)
//            try JSONAny.encode(to: &container, dictionary: dict)
//        } else {
//            var container = encoder.singleValueContainer()
//            try JSONAny.encode(to: &container, value: self.value)
//        }
//    }
//}







// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let data: [Datum]?
}

// MARK: - Datum
struct Datum: Codable {
    let id, leagueID, seasonID, stageID: Int?
    let round: String?
    let localteam_id, visitorteamID: Int?
    let starting_at: String?
    let type: String?
    let live: Bool?
    let status: String?
    let note: String?
    let venueID, tossWonTeamID: Int?
    let winnerTeamID: Int?
    let drawNoresult: String?
    let firstUmpireID, secondUmpireID, tvUmpireID, refereeID: Int?
    let manOfMatchID, manOfSeriesID, totalOversPlayed: Int?
    let elected: String?
    let rpcOvers, rpcTarget: String?
    let league: League?
    let localteam, visitorteam: Team?
    let runs: [Run]?
    let stage: League?
    let venue: Venue?
}

// MARK: - League
struct League: Codable {
    let id, seasonID, countryID: Int?
    let name: String?
    let code: String?
    let image_path: String?
    let updatedAt: String?
    let leagueID: Int?
    let standings: Bool?
}


// MARK: - Team
struct Team: Codable {
    let id: Int?
    let name: String?
    let image_path: String?
    let updatedAt: String?
}

// MARK: - Run
struct Run: Codable {
    let id, fixtureID, team_id, inning: Int?
    let score, wickets: Int?
    let overs: Double?
    let updatedAt: String?
}

// MARK: - Venue
struct Venue: Codable {
    let id, countryID: Int?
    let name, city: String?
    let imagePath: String?
    let capacity: Int?
    let floodlight: Bool?
    let updatedAt: String?
}
