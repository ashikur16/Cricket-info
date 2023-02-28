//
//  HomeViewModel.swift
//  Cricket_Info
//
//  Created by bjit on 10/2/23.
//

import Foundation

class HomeViewModel {
    var matchData: ObservableObject<Welcome?> = ObservableObject(nil)
    var matchDataUpcoming: ObservableObject<Welcome?> = ObservableObject(nil)
    
    func getDataFromApi(url: String) {
        APICaller.shared.getDataFromApi(url: url, type: Welcome.self) { [weak self] data in
            self?.matchData.value = data
        }
    }
    
    func getDataFromApiForUpcomingMatch(url: String) {
        APICaller.shared.getDataFromApi(url: url, type: Welcome.self) { [weak self] data in
            self?.matchDataUpcoming.value = data
        }
    }
}
