//
//  ScoreboardViewController.swift
//  Cricket_Info
//
//  Created by bjit on 15/2/23.
//

import UIKit

class ScoreboardViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var fixtureId: Int?
    var localteam: String?
    var visitorTeam: String?
    
    var scoreboardModel = ScoreboardViewModel()
    var bat = [Batting]()
    var ball = [Bowling]()
    
    @IBOutlet weak var teamChooseSegmentController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamChooseSegmentController.setTitle(localteam, forSegmentAt: 0)
        teamChooseSegmentController.setTitle(visitorTeam, forSegmentAt: 1)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: Identifiers.HeaderScoreboard, bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: Identifiers.HeaderScoreboard)
        
        guard let fixtureId = fixtureId else {
            return
        }
        let url = ConfigURL.shared.setUpUrlForScoreboard(fixtureId: fixtureId)
        guard let url = url else {
            return
        }
//        let url = "https://cricket.sportmonks.com/api/v2.0/fixtures/\(fixtureId ?? 0)?include=batting.batsman,bowling.bowler,localteam,visitorteam&api_token=Q4n2tb4ae8ud9Kva0hTLQHsTXIuqpYySbyl5mIQxahd46oRv8a6lYVIhXNzJ"
        self.scoreboardModel.getDataFromApi(url: url)
        
//        scoreboardModel.fixtureId.bind { [weak self] id in
//            let url = "https://cricket.sportmonks.com/api/v2.0/fixtures/\(id!)?include=batting.batsman,bowling.bowler,localteam,visitorteam&api_token=Q4n2tb4ae8ud9Kva0hTLQHsTXIuqpYySbyl5mIQxahd46oRv8a6lYVIhXNzJ"
//            self?.scoreboardModel.getDataFromApi(url: url)
//        }
        
        self.scoreboardModel.scoreboard.bind { [weak self] score in
            self?.scoreboardModel.differentiateTeamWiseBatting()
            self?.scoreboardModel.differentiateTeamWiseBowling()
            
            guard let localTeamBatting = self?.scoreboardModel.localTeamBatting, let localTeamBowling = self?.scoreboardModel.localTeamBowling else {
                return
                
            }
            self?.bat = localTeamBatting
            self?.ball = localTeamBowling
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    
    @IBAction func chooseTeam(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            bat = self.scoreboardModel.localTeamBatting
            ball = self.scoreboardModel.localTeamBowling
            
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
        else {
            bat = self.scoreboardModel.visitorTeamBatting
            ball = self.scoreboardModel.visitorTeamBowling
            
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}

extension ScoreboardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension ScoreboardViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if (section == 0) {
            let sectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: Identifiers.HeaderScoreboard) as! HeaderScoreboard
            sectionHeader.contentView.backgroundColor = .lightGray
            sectionHeader.batsman.text = "Batsman"
            sectionHeader.runs.text = "R"
            sectionHeader.balls.text = "B"
            sectionHeader.fours.text = "4s"
            sectionHeader.sixs.text = "6s"
            sectionHeader.strikeRate.text = "SR"
            
            return sectionHeader
        }
        
        else  {
            let sectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: Identifiers.HeaderScoreboard) as! HeaderScoreboard
            sectionHeader.contentView.backgroundColor = .lightGray
            sectionHeader.batsman.text = "Bowler"
            sectionHeader.runs.text = "R"
            sectionHeader.balls.text = "Ov"
            sectionHeader.fours.text = "Wk"
            sectionHeader.sixs.text = "W"
            sectionHeader.strikeRate.text = "ER"
            return sectionHeader
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
//            return scoreboardModel.localTeamBatting.count ?? 0
            return bat.count ?? 0
        }
        else {
//            return scoreboardModel.localTeamBowling.count ?? 0
            return ball.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.ScoreboardCell) as! ScoreboardTableViewCell
//            cell.playerName.text = scoreboardModel.localTeamBatting[indexPath.row].batsman?.fullname
//            cell.runs.text = String(scoreboardModel.localTeamBatting[indexPath.row].score ?? 0)
//            cell.balls.text = String(scoreboardModel.localTeamBatting[indexPath.row].ball ?? 0)
//            cell.fours.text = String(scoreboardModel.localTeamBatting[indexPath.row].four_x ?? 0)
//            cell.sixs.text = String(scoreboardModel.localTeamBatting[indexPath.row].six_x ?? 0)
//            cell.strikeRate.text = String(scoreboardModel.localTeamBatting[indexPath.row].rate ?? 0)
            
            if bat[indexPath.row].bowling_player_id == nil {
                cell.playerName.text = "\(bat[indexPath.row].batsman?.fullname ?? "") *"
            }
            else {
                cell.playerName.text = bat[indexPath.row].batsman?.fullname
            }
            
            cell.runs.text = String(bat[indexPath.row].score ?? 0)
            cell.balls.text = String(bat[indexPath.row].ball ?? 0)
            cell.fours.text = String(bat[indexPath.row].four_x ?? 0)
            cell.sixs.text = String(bat[indexPath.row].six_x ?? 0)
            cell.strikeRate.text = String(bat[indexPath.row].rate ?? 0)
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.ScoreboardCell) as! ScoreboardTableViewCell
            
//            cell.playerName.text = scoreboardModel.localTeamBowling[indexPath.row].bowler?.fullname
//            cell.runs.text = String(scoreboardModel.localTeamBowling[indexPath.row].runs ?? 0)
//            cell.balls.text = String(scoreboardModel.localTeamBowling[indexPath.row].overs ?? 0)
//            cell.fours.text = String(scoreboardModel.localTeamBowling[indexPath.row].wickets ?? 0)
//            cell.sixs.text = String(scoreboardModel.localTeamBowling[indexPath.row].medians ?? 0)
//            cell.strikeRate.text = String(scoreboardModel.localTeamBowling[indexPath.row].rate ?? 0)
            
            cell.playerName.text = ball[indexPath.row].bowler?.fullname
            cell.runs.text = String(ball[indexPath.row].runs ?? 0)
            cell.balls.text = String(ball[indexPath.row].overs ?? 0)
            cell.fours.text = String(ball[indexPath.row].wickets ?? 0)
            cell.sixs.text = String(ball[indexPath.row].wide ?? 0)
            cell.strikeRate.text = String(ball[indexPath.row].rate ?? 0)
            
            return cell
        }
    }
}
