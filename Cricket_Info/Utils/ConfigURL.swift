//
//  ConfigURL.swift
//  Cricket_Info
//
//  Created by bjit on 10/2/23.
//

import Foundation

class ConfigURL {
    
    static let shared = ConfigURL()
    private init() {}
    func setUpUrl() -> String? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "cricket.sportmonks.com"
        urlComponents.path = "/api/v2.0/fixtures"
        urlComponents.queryItems = [
           URLQueryItem(name: "filter[status]", value: "Finished"),
           URLQueryItem(name: "include", value: "runs,localteam,visitorteam,league,stage"),
           URLQueryItem(name: "sort", value: "-starting_at"),
           URLQueryItem(name: "fields[teams]", value: "name,image_path"),
           URLQueryItem(name: "api_token", value: "Q4n2tb4ae8ud9Kva0hTLQHsTXIuqpYySbyl5mIQxahd46oRv8a6lYVIhXNzJ")
        ]
        return urlComponents.url?.absoluteString
    }
    
    func setUpUrlForRecentMatches() -> String? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "cricket.sportmonks.com"
        urlComponents.path = "/api/v2.0/fixtures"
        urlComponents.queryItems = [
           URLQueryItem(name: "filter[status]", value: "NS"),
           URLQueryItem(name: "include", value: "runs,localteam,visitorteam,league,stage,venue"),
           URLQueryItem(name: "sort", value: "starting_at"),
           URLQueryItem(name: "fields[teams]", value: "name,image_path"),
           URLQueryItem(name: "api_token", value: "Q4n2tb4ae8ud9Kva0hTLQHsTXIuqpYySbyl5mIQxahd46oRv8a6lYVIhXNzJ")
        ]
        return urlComponents.url?.absoluteString
    }
}
