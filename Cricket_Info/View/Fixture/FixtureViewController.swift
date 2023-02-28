//
//  FixtureViewController.swift
//  Cricket_Info
//
//  Created by bjit on 22/2/23.
//

import UIKit

class FixtureViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = FixtureViewModel()
    
    let leagueName = ["T20I", "BBL", "T20C"]
    let leagueLogo = ["https://cdn.sportmonks.com/images/cricket/leagues/3/3.png",
                        "https://cdn.sportmonks.com/images/cricket/leagues/5/5.png",
                        "https://cdn.sportmonks.com/images/cricket/leagues/10/10.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let url = ConfigURL.shared.setUpUrlForFixture(leagueId: 3)
        guard let url = url else {
            return
        }
        viewModel.getDataFromApi(url: url)
        viewModel.matchDataUpcoming.bind { data in
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    func getMatchLeagueWise(leagueId: Int) {
        let url = ConfigURL.shared.setUpUrlForFixture(leagueId: leagueId)
        guard let url = url else {
            return
        }
        viewModel.getDataFromApi(url: url)
        viewModel.matchDataUpcoming.bind { data in
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    func navigateToViewControllerUpcoming(index: Int) {
 
        let fixtureID = viewModel.matchDataUpcoming.value?.data?[index].id ?? 0
        let storyboard = UIStoryboard(name: "Matches", bundle: nil)
        let controllerDetail = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        guard let controllerDetail = controllerDetail else {
            return
        }
        //controllerDetail.loadViewIfNeeded()
        controllerDetail.fixId = fixtureID
        controllerDetail.localteam = viewModel.matchDataUpcoming.value?.data?[index].localteam?.name
        controllerDetail.visitorTeam = viewModel.matchDataUpcoming.value?.data?[index].visitorteam?.name
        controllerDetail.loadViewIfNeeded()
        self.navigationController?.pushViewController(controllerDetail, animated: true)
    }
}

extension FixtureViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        if indexPath.row == 0 {
           getMatchLeagueWise(leagueId: 3)
        }
        else if indexPath.row == 1 {
            getMatchLeagueWise(leagueId: 5)
        }
        else {
            getMatchLeagueWise(leagueId: 10)
        }
    }
}

extension FixtureViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FixtureCollectionViewCell", for: indexPath) as! FixturueCollectionViewCell
        cell.leagueName.text = leagueName[indexPath.row]
        cell.leagueLogo.sd_setImage(with: URL(string: leagueLogo[indexPath.row]), completed: nil)
        
        return cell
    }
}

extension FixtureViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        navigateToViewControllerUpcoming(index: indexPath.row)
    }
}

extension FixtureViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.matchDataUpcoming.value?.data?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FixtureTableViewCell") as! FixtureTableViewCell
        cell.bgView.setShadow()
        cell.leagueName.text = viewModel.matchDataUpcoming.value?.data?[indexPath.row].league?.name
        cell.venue.text = viewModel.matchDataUpcoming.value?.data?[indexPath.row].venue?.name
        cell.dateLabel.text = SharedClass.shared.cutString(startIndex: 0, offset: 10, originalString: viewModel.matchDataUpcoming.value?.data?[indexPath.row].starting_at ?? "")
        cell.timeLabel.text = SharedClass.shared.cutString(startIndex: 12, offset: 4, originalString: viewModel.matchDataUpcoming.value?.data?[indexPath.row].starting_at ?? "")
        
        cell.team1Name.text = viewModel.matchDataUpcoming.value?.data?[indexPath.row].localteam?.name
        cell.team1Flag.sd_setImage(with: URL(string: viewModel.matchDataUpcoming.value?.data?[indexPath.row].localteam?.image_path ?? ""), completed: nil)
        
        cell.team2Name.text = viewModel.matchDataUpcoming.value?.data?[indexPath.row].visitorteam?.name
        cell.team2Flag.sd_setImage(with: URL(string: viewModel.matchDataUpcoming.value?.data?[indexPath.row].visitorteam?.image_path ?? ""), completed: nil)
        cell.round.text = viewModel.matchDataUpcoming.value?.data?[indexPath.row].round
        return cell
    }
}
