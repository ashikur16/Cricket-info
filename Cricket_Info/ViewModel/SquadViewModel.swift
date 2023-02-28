//
//  SquadViewModel.swift
//  Cricket_Info
//
//  Created by bjit on 13/2/23.
//

import Foundation

class SquadViewModel {
    
    var squad: ObservableObject<Squad?> = ObservableObject(nil)
    var team1 = [LineupElement]()
    var team2 = [LineupElement]()
    
    func getDataFromApi(url: String) {
        APICaller.shared.getDataFromApi(url: url, type: Squad.self) { [weak self] data in
            self?.squad.value = data
        }
    }
    
    func differentiateTeamWisePlayer() {
        
        for i in 0..<(squad.value?.data?.lineup?.count ?? 0) {
            if let data1 = squad.value?.data?.lineup?[i].lineup?.team_id ,let data2 = squad.value?.data?.localteam_id {
                if data1 == data2 {
                    if let data3 = squad.value?.data?.lineup?[i] {
                        team1.append(data3)
                    }
                }
                else {
                    if let data3 = squad.value?.data?.lineup?[i] {
                        team2.append(data3)
                    }
                }
            }
        }
    }
}
