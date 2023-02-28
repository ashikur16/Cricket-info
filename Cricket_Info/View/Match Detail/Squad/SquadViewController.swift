//
//  SquadViewController.swift
//  Cricket_Info
//
//  Created by bjit on 13/2/23.
//

import UIKit
import SDWebImage

class SquadViewController: UIViewController {
    
    var squadModel = SquadViewModel()
    var fixtureID: Int?
    var localteam: String?
    var visitorTeam: String?
 
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: Identifiers.HeaderSquadTableViewCell, bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: Identifiers.HeaderSquadTableViewCell)
        
        let url = ConfigURL.shared.setUpUrlForSquad(fixtureId: fixtureID ?? 0)
        self.squadModel.getDataFromApi(url: url!)
        
//        squadModel.fixtureId.bind { [weak self] id in
//            let url = ConfigURL.shared.setUpUrlForSquad(fixtureId: id ?? 0)
//            self?.squadModel.getDataFromApi(url: url!)
//        }
//
        squadModel.squad.bind { [weak self] data in
            dump(data)
            self?.squadModel.differentiateTeamWisePlayer()
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}

extension SquadViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        
        var playerId = 0
        
        if indexPath.section == 0 {
            playerId = squadModel.team1[indexPath.row].id ?? 0
        }
        else {
            playerId = squadModel.team2[indexPath.row].id ?? 0
        }
        
        let controller = storyboard?
            .instantiateViewController(withIdentifier: Identifiers.PlayerDetailViewController) as? PlayerDetailViewController
        guard let controller = controller else {
            return
        }
        controller.loadViewIfNeeded()
        controller.playerDetailViewModel.setplayerId(id: playerId)
        //controller.loadViewIfNeeded()
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}

extension SquadViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if (section == 0) {
            let sectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: Identifiers.HeaderSquadTableViewCell) as! HeaderSquadTableViewCell
            sectionHeader.contentView.backgroundColor = .white
            sectionHeader.teamName.text = localteam
            return sectionHeader
        }
        
        else  {
            let sectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: Identifiers.HeaderSquadTableViewCell) as! HeaderSquadTableViewCell
            sectionHeader.contentView.backgroundColor = .white
            sectionHeader.teamName.text = visitorTeam
            return sectionHeader
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.squadModel.team1.count
        }
        else {
            return self.squadModel.team2.count 
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.Team1SquadCell) as! Team1SquadTableViewCell
            cell.playerName.text = self.squadModel.team1[indexPath.row].fullname ?? ""
            cell.playerImage.sd_setImage(with: URL(string: self.squadModel.team1[indexPath.row].image_path ?? ""), completed: nil)
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.Team1SquadCell) as! Team1SquadTableViewCell
            cell.playerName.text = self.squadModel.team2[indexPath.row].fullname ?? ""
            cell.playerImage.sd_setImage(with: URL(string: self.squadModel.team2[indexPath.row].image_path ?? ""), completed: nil)
            return cell
        }
    }
}
