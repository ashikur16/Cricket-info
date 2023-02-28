//
//  ViewController.swift
//  Cricket_Info
//
//  Created by bjit on 9/2/23.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    var run1: Int?
    var run2: Int?
    var wicket1: Int?
    var wicket2: Int?
    var over1: Double?
    var over2: Double?
    var flag = false
    var flag2 = false
    var fixtureID: Int?
    
    var viewModel = HomeViewModel()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //CheckNetwork.shared.monitorNetwork(viewController: self)
        
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
        
        tableView.delegate = self
        tableView.dataSource = self
  
        let nibCell = UINib(nibName: Identifiers.LiveMatchCollectionViewCell, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: Identifiers.LiveNibCell)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let url = ConfigURL.shared.setUpUrl()
        setUp(url: url!)
        
        let url2 = ConfigURL.shared.setUpUrlForRecentMatches()
        setUpForUpcoming(url: url2!)
        
        let url3 = ConfigURL.shared.setUpUrlForLive()
        setUpForLive(url: url3!)
    }
    
    func setUp(url: String) {
        viewModel.getDataFromApi(url: url)
        viewModel.matchData.bind { [weak self] matchData in
            dump(matchData)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func setUpForUpcoming(url: String) {
        viewModel.getDataFromApiForUpcomingMatch(url: url)
        viewModel.matchDataUpcoming.bind { [weak self] matchData in
            dump(matchData)
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    func setUpForLive(url: String) {
        viewModel.getDataFromApiForLiveMatch(url: url)
        viewModel.matchDataLive.bind { [weak self] matchData in
            dump(matchData)
            print("LIVE Match: ", matchData)
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    func observeTeamWiseRun(index: Int) {
        
        viewModel.checkTeamWiseRun(index: index)
        
        viewModel.run1.bind { [weak self] run in
            self?.run1 = run
        }
        viewModel.run2.bind { [weak self] run in
            self?.run2 = run
        }
        viewModel.wicket1.bind { [weak self] run in
            self?.wicket1 = run
        }
        viewModel.wicket2.bind { [weak self] run in
            self?.wicket2 = run
            
        }
        viewModel.over1.bind { [weak self] run in
            self?.over1 = run
        }
        viewModel.over2.bind { [weak self] run in
            self?.over2 = run
        }
    }
    
    func observeTeamWiseRunForLive(index: Int) {
        
        viewModel.checkTeamWiseRunForLive(index: index)
        
        viewModel.run1.bind { [weak self] run in
            self?.run1 = run
        }
        viewModel.run2.bind { [weak self] run in
            self?.run2 = run
        }
        viewModel.wicket1.bind { [weak self] run in
            self?.wicket1 = run
        }
        viewModel.wicket2.bind { [weak self] run in
            self?.wicket2 = run
            
        }
        viewModel.over1.bind { [weak self] run in
            self?.over1 = run
        }
        viewModel.over2.bind { [weak self] run in
            self?.over2 = run
        }
    }
    
//    func navigateToViewControllerUpcoming(index: Int) {
//
//        fixtureID = viewModel.matchDataUpcoming.value?.data?[index].id ?? 0
//        let controllerDetail = storyboard?
//            .instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
//        guard let controllerDetail = controllerDetail else {
//            return
//        }
//        //controllerDetail.loadViewIfNeeded()
//        controllerDetail.fixId = fixtureID
//        controllerDetail.localteam = viewModel.matchDataUpcoming.value?.data?[index].localteam?.name
//        controllerDetail.visitorTeam = viewModel.matchDataUpcoming.value?.data?[index].visitorteam?.name
//        controllerDetail.loadViewIfNeeded()
//        self.navigationController?.pushViewController(controllerDetail, animated: true)
//    }
//
//    func navigateToViewControllerRecent(index: Int) {
//
//        fixtureID = viewModel.matchData.value?.data?[index].id ?? 0
//        let controllerDetail = storyboard?
//            .instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
//        guard let controllerDetail = controllerDetail else {
//            return
//        }
//        //controllerDetail.loadViewIfNeeded()
//        controllerDetail.fixId = fixtureID
//        controllerDetail.localteam = viewModel.matchData.value?.data?[index].localteam?.name
//        controllerDetail.visitorTeam = viewModel.matchData.value?.data?[index].visitorteam?.name
//        controllerDetail.loadViewIfNeeded()
//        self.navigationController?.pushViewController(controllerDetail, animated: true)
//    }
//
//
//    func navigateToViewControllerLive(index: Int) {
//
//        fixtureID = viewModel.matchDataLive.value?.data?[index].id ?? 0
//        let controllerDetail = storyboard?
//            .instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
//        guard let controllerDetail = controllerDetail else {
//            return
//        }
//        //controllerDetail.loadViewIfNeeded()
//        controllerDetail.fixId = fixtureID
//        controllerDetail.localteam = viewModel.matchDataLive.value?.data?[index].localteam?.name
//        controllerDetail.visitorTeam = viewModel.matchDataLive.value?.data?[index].visitorteam?.name
//        controllerDetail.loadViewIfNeeded()
//        self.navigationController?.pushViewController(controllerDetail, animated: true)
//    }
    
}
