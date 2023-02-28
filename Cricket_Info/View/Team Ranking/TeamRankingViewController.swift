//
//  TeamRankingViewController.swift
//  Cricket_Info
//
//  Created by bjit on 20/2/23.
//

import UIKit

class TeamRankingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let teamRankViewModel = TeamRankingViewModel()
    @IBOutlet weak var segmentController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let url = ConfigURL.shared.setUrlForTeamRanking(type: "Test")
        guard let url = url else {
            return
        }
        teamRankViewModel.getDataFromApi(url: url)
        teamRankViewModel.teams.bind { [weak self] rank in
            //self?.getDataTypeWise(type: "Test")
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    func getDataTypeWise(type: String) {
        
        let url = ConfigURL.shared.setUrlForTeamRanking(type: type)
        guard let url = url else {
            return
        }
        teamRankViewModel.getDataFromApi(url: url)
        teamRankViewModel.teams.bind { rank in
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    @IBAction func chooseType(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            getDataTypeWise(type: "Test")
        }
        else if sender.selectedSegmentIndex == 1 {
            getDataTypeWise(type: "ODI")
        }
        else {
            getDataTypeWise(type: "T20")
        }
    }
}

extension TeamRankingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
extension TeamRankingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamRankViewModel.teams.value?.data?[0].team?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.TeamRankingTableViewCell) as! TeamRankingTableViewCell
        cell.rank.text = String(teamRankViewModel.teams.value?.data?[0].team?[indexPath.row].ranking?.position ?? 0)
        cell.teamName.text = teamRankViewModel.teams.value?.data?[0].team?[indexPath.row].name
        cell.teamFlag.sd_setImage(with: URL(string: teamRankViewModel.teams.value?.data?[0].team?[indexPath.row].image_path ?? ""), completed: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        let transform = CATransform3DTranslate(CATransform3DIdentity, 250, 0, 0)
        cell.layer.transform = transform

        UIView.animate(withDuration: 0.4) {
            cell.alpha = 1
            cell.layer.transform = CATransform3DIdentity
        }
        
//        cell.transform = CGAffineTransform(translationX: 0, y: cell.contentView.frame.height)
//        UIView.animate(withDuration: 0.5,delay: 0.05 * Double(indexPath.row)) {
//            cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
//        }
    }
}
