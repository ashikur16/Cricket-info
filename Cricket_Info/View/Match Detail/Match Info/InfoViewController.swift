//
//  InfoViewController.swift
//  Cricket_Info
//
//  Created by bjit on 15/2/23.
//

import UIKit
import SDWebImage

class InfoViewController: UIViewController {
    
    var viewModel = InfoViewModel()
    var fixtureID: Int?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
//        let url = "https://cricket.sportmonks.com/api/v2.0/fixtures/\(fixtureID ?? 0)?include=venue,league,manofmatch,tosswon&api_token=Q4n2tb4ae8ud9Kva0hTLQHsTXIuqpYySbyl5mIQxahd46oRv8a6lYVIhXNzJ"
        let url = ConfigURL.shared.setUpUrlForInfo(fixtureId: fixtureID ?? 0)
        
        guard let url = url else {
            return
        }
        self.setUp(url: url)
        //self.fixtureID = id
        
//        viewModel.fixtureId.bind { [weak self] id in
//            let url = "https://cricket.sportmonks.com/api/v2.0/fixtures/\(id ?? 0)?include=venue,league,manofmatch,tosswon&api_token=Q4n2tb4ae8ud9Kva0hTLQHsTXIuqpYySbyl5mIQxahd46oRv8a6lYVIhXNzJ"
//            
//            self?.setUp(url: url)
//            self?.fixtureID = id
//        }
//        print("I am Good")
    }

    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == Identifiers.InfoToSquad {
//            let destinationVC = segue.destination as! SquadViewController
//            destinationVC.fixtureID = fixtureID
//        }
//    }
    
    func setUp(url: String) {
        viewModel.getDataFromApi(url: url)
        
        viewModel.info.bind { matchInfo in
            dump(matchInfo)
            DispatchQueue.main.async {
//                self.stadiumName.text = matchInfo?.data?.venue?.name
//                self.stadiumCity.text = matchInfo?.data?.venue?.city
//                self.stadiumImage.sd_setImage(with: URL(string: matchInfo?.data?.venue?.image_path ?? ""), completed: nil)
//
//                self.playerName.text = matchInfo?.data?.manofmatch?.fullname
//                self.playerPosition.text = matchInfo?.data?.manofmatch?.position?.name
//                self.playerImage.sd_setImage(with: URL(string: matchInfo?.data?.manofmatch?.image_path ?? ""), completed: nil)
//
//                self.leagueName.text = matchInfo?.data?.league?.name
//                self.leagueImage.sd_setImage(with: URL(string: matchInfo?.data?.league?.image_path ?? ""), completed: nil)
//
//                self.tossWon.text = matchInfo?.data?.tosswon?.name
//                self.teamImage.sd_setImage(with: URL(string: matchInfo?.data?.tosswon?.image_path ?? ""), completed: nil)
                self.tableView.reloadData()
            }
        }
    }
}

extension InfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension InfoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.InfoTableViewCell) as! InfoTableViewCell
            print("viewModel.info.value?.data?.startingAt", viewModel.info.value?.data?.starting_at)
            cell.headerLabel.text = "Venue"
            cell.label1.text = viewModel.info.value?.data?.venue?.name
            cell.label2.text = viewModel.info.value?.data?.venue?.city
            cell.label3.text = "Capacity: \(viewModel.info.value?.data?.venue?.capacity ?? 0)"
            cell.label4.text = ""
            cell.img.sd_setImage(with: URL(string: viewModel.info.value?.data?.venue?.image_path ?? ""), completed: nil)
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.InfoTableViewCell) as! InfoTableViewCell
            cell.headerLabel.text = "Man of the match"
            cell.label1.text = viewModel.info.value?.data?.manofmatch?.fullname
            cell.label2.text = viewModel.info.value?.data?.manofmatch?.position?.name
            cell.label3.text = viewModel.info.value?.data?.manofmatch?.dateofbirth
            cell.label4.text = ""
            cell.img.sd_setImage(with: URL(string: viewModel.info.value?.data?.manofmatch?.image_path ?? ""), completed: nil)
            return cell
        }
        
        else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.InfoTableViewCell) as! InfoTableViewCell
            cell.headerLabel.text = "League Info"
            cell.label1.text = viewModel.info.value?.data?.league?.name
            cell.label2.text = ""
            cell.label3.text = ""
            cell.label4.text = ""
            cell.img.sd_setImage(with: URL(string: viewModel.info.value?.data?.league?.image_path ?? ""), completed: nil)
            return cell
        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.InfoTableViewCell) as! InfoTableViewCell
            cell.headerLabel.text = "Toss Won"
            cell.label1.text = viewModel.info.value?.data?.tosswon?.name
            cell.label2.text = ""
            cell.label3.text = ""
            cell.label4.text = ""
            cell.img.sd_setImage(with: URL(string: viewModel.info.value?.data?.tosswon?.image_path ?? ""), completed: nil)
            return cell
        }
        
    }
}
