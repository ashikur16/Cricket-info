//
//  PlayerDetailViewController.swift
//  Cricket_Info
//
//  Created by bjit on 17/2/23.
//

import UIKit

class PlayerDetailViewController: UIViewController {
    
    var playerDetailViewModel = PlayerDetailViewModel()
    var selectedSection1 = false
    var selectedSection2 = false
    var selectedSection3 = false
    var selectedSection4 = false
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var countryFlag: UIImageView!
    @IBOutlet weak var playerImage: UIImageView!

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
//
//        let nib = UINib(nibName: "HeaderPlayerDetailTableViewCell", bundle: nil)
//        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "HeaderPlayerDetailTableViewCell")
        
        playerDetailViewModel.playerId.bind { [weak self] playerId in
            print("Player ID: ", playerId)
            guard let playerId = playerId else {
                return
            }
            let url = ConfigURL.shared.setUpUrlForPlayerDetail(playerId: playerId)
            guard let url = url else {
                return
            }
            guard let self = self else {
                return
            }
            print(url)
            self.playerDetailViewModel.getDataFromApi(url: url)
            self.playerDetailViewModel.playerDetail.bind { playerData in
                DispatchQueue.main.async {
                    self.playerName.text = self.playerDetailViewModel.playerDetail.value?.data?.fullname
                    self.country.text = self.playerDetailViewModel.playerDetail.value?.data?.country?.name
                    self.countryFlag.sd_setImage(with: URL(string: self.playerDetailViewModel.playerDetail.value?.data?.country?.image_path ?? ""), completed: nil)
                    self.playerImage.sd_setImage(with: URL(string: self.playerDetailViewModel.playerDetail.value?.data?.image_path ?? ""), completed: nil)
                    self.tableView.reloadData()
                }
            }
        }
    }
}


extension PlayerDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = 45
        if indexPath.section == 0 {
            if selectedSection1 == true {
                height = 250
            }
            else {
                height = 45
            }
        }

        else if indexPath.section == 1 {
            if selectedSection2 == true {
                height = 250
            }
            else {
                height = 45
            }
        }

        else if indexPath.section == 2 {
            if selectedSection3 == true {
                height = 250
            }
            else {
                height = 45
            }
        }

        else if indexPath.section == 3 {
            if selectedSection4 == true {
                height = 250
            }
            else {
                height = 45
            }
        }
        return CGFloat(height)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.PlayerDetailTableViewCell) as! PlayerDetailTableViewCell
            cell.dateOfBirth.text = playerDetailViewModel.playerDetail.value?.data?.dateofbirth ?? "-"
            cell.country.text = playerDetailViewModel.playerDetail.value?.data?.country?.name ?? "-"
            cell.nickName.text = playerDetailViewModel.playerDetail.value?.data?.firstname ?? "-"
            cell.role.text = playerDetailViewModel.playerDetail.value?.data?.position?.name ?? "-"
            cell.battingStyle.text = playerDetailViewModel.playerDetail.value?.data?.battingstyle ?? "-"
            cell.bowlingStyle.text = playerDetailViewModel.playerDetail.value?.data?.bowlingstyle ?? "-"
            return cell
        }
        else if indexPath.section == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerDetailSection2TableViewCell") as! PlayerDetailSection2TableViewCell
            var data = playerDetailViewModel.calculatePlayerStatisticsTypeWise(type: "ODI")
            cell.stateType.text = "ODI Statistics"
            cell.battingMatch.text = data.0
            cell.battingRun.text = data.1
            cell.battingHighestRun.text = data.2
            cell.battingAverage.text = data.3
            cell.battingStrikeRate.text = data.4
            cell.battingHundred.text = data.5
            cell.battingFifty.text = data.6
            
            cell.bowlingMatch.text = data.7
            cell.bowlingOver.text = data.8
            cell.bowlingRun.text = data.9
            cell.bowlingWicket.text = data.10
            cell.bowlingAverage.text = data.11
            cell.bowlingRate.text = data.12
            cell.bowlingNoBall.text = data.13
            return cell
        }
        else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerDetailSection2TableViewCell") as! PlayerDetailSection2TableViewCell
            var data = playerDetailViewModel.calculatePlayerStatisticsTypeWise(type: "T20")
            cell.stateType.text = "T20 Statistics"

            cell.battingMatch.text = data.0
            cell.battingRun.text = data.1
            cell.battingHighestRun.text = data.2
            cell.battingAverage.text = data.3
            cell.battingStrikeRate.text = data.4
            cell.battingHundred.text = data.5
            cell.battingFifty.text = data.6
            
            cell.bowlingMatch.text = data.7
            cell.bowlingOver.text = data.8
            cell.bowlingRun.text = data.9
            cell.bowlingWicket.text = data.10
            cell.bowlingAverage.text = data.11
            cell.bowlingRate.text = data.12
            cell.bowlingNoBall.text = data.13
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerDetailSection2TableViewCell") as! PlayerDetailSection2TableViewCell
            var data = playerDetailViewModel.calculatePlayerStatisticsTypeWise(type: "T20I")
            cell.stateType.text = "T20I Statistics"
            cell.battingMatch.text = data.0
            cell.battingRun.text = data.1
            cell.battingHighestRun.text = data.2
            cell.battingAverage.text = data.3
            cell.battingStrikeRate.text = data.4
            cell.battingHundred.text = data.5
            cell.battingFifty.text = data.6
            
            cell.bowlingMatch.text = data.7
            cell.bowlingOver.text = data.8
            cell.bowlingRun.text = data.9
            cell.bowlingWicket.text = data.10
            cell.bowlingAverage.text = data.11
            cell.bowlingRate.text = data.12
            cell.bowlingNoBall.text = data.13
            
            return cell
        }
    }
}

extension PlayerDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        print("section: ", indexPath.section)
        if indexPath.section == 0 {
            selectedSection1 = true
            selectedSection2 = false
            selectedSection3 = false
            selectedSection4 = false
        }
        
        else if indexPath.section == 1 {
            selectedSection1 = false
            selectedSection2 = true
            selectedSection3 = false
            selectedSection4 = false
        }
        
        else if indexPath.section == 2 {
            selectedSection1 = false
            selectedSection2 = false
            selectedSection3 = true
            selectedSection4 = false
        }
        else if indexPath.section == 3 {
            selectedSection1 = false
            selectedSection2 = false
            selectedSection3 = false
            selectedSection4 = true
        }
        tableView.reloadData()

    }
}
