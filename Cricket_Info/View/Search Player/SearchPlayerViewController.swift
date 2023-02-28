//
//  UpcomingMatchViewController.swift
//  Cricket_Info
//
//  Created by bjit on 11/2/23.
//

import UIKit

class SearchPlayer: UIViewController {

    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var playerViewModel = SearchPlayerViewModel()
    var playerArray = [PlayerEntity]()
    var search = " "
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.layer.cornerRadius = 20
        searchBar.clipsToBounds = true
        
        ConfigSearchBar.shared.createSearchBar(searchBar: searchBar)
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        playerArray = CoreDataManger.shared.getAllRecords(search: search, fetchOffset: 5)
        
        if playerArray.isEmpty {
            addIetmInCoreData()
        }
    }
    
    func addIetmInCoreData() {
        CoreDataManger.shared.deleteAll()
        playerArray = CoreDataManger.shared.getAllRecords(search: search, fetchOffset: 5)
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
        
        let url = ConfigURL.shared.setUrlForPlayer()
        guard let url = url else {
            return
        }
        playerViewModel.getDataFromApi(url: url)
        
        playerViewModel.playerDetail.bind { player in
            guard let player = player else {
                return
            }
            CoreDataManger.shared.addItemsBatchInsert(data: player)
        }
        
        playerArray = CoreDataManger.shared.getAllRecords(search: search, fetchOffset: 5)
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    @IBAction func loadPlayer(_ sender: Any) {
            print("")
//        CoreDataManger.shared.deleteAll()
//        playerArray = CoreDataManger.shared.getAllRecords(search: search, fetchOffset: 5)
//        DispatchQueue.main.async { [weak self] in
//            self?.tableView.reloadData()
//        }
//
//        let url = ConfigURL.shared.setUrlForPlayer()
//        guard let url = url else {
//            return
//        }
//        playerViewModel.getDataFromApi(url: url)
//
//        let group = DispatchGroup()
//        activityIndicator.startAnimating()
//
//        DispatchQueue.global().async(group: group) { [weak self] in
//
//            self?.playerViewModel.playerDetail.bind { player in
//                guard let player = player else {
//                    return
//                }
//                CoreDataManger.shared.addItems(data: player)
//            }
//
//        }
//        activityIndicator.stopAnimating()
//        group.wait()
//
//        playerArray = CoreDataManger.shared.getAllRecords(search: search, fetchOffset: 5)
//        DispatchQueue.main.async { [weak self] in
//            self?.tableView.reloadData()
//        }
//    }
        
        
        
        
//
//        CoreDataManger.shared.deleteAll()
//        playerArray = CoreDataManger.shared.getAllRecords(search: search, fetchOffset: 5)
//        DispatchQueue.main.async { [weak self] in
//            self?.tableView.reloadData()
//        }
//
//        let url = ConfigURL.shared.setUrlForPlayer()
//        guard let url = url else {
//            return
//        }
//        playerViewModel.getDataFromApi(url: url)
//
//        playerViewModel.playerDetail.bind { player in
//            guard let player = player else {
//                return
//            }
//            CoreDataManger.shared.addItemsBatchInsert(data: player)
//        }
//
//        playerArray = CoreDataManger.shared.getAllRecords(search: search, fetchOffset: 5)
//        DispatchQueue.main.async { [weak self] in
//            self?.tableView.reloadData()
//        }
    }
}

// MARK: - TextField Delegate
extension SearchPlayer: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        search = searchBar.text!
        playerArray = CoreDataManger.shared.getAllRecords(search: search, fetchOffset: 0)
        tableView.reloadData()
        return true
    }
}

// MARK: - TableView Delegate
extension SearchPlayer: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        
        let storyboard = UIStoryboard(name: "Matches", bundle: nil)
        
        let controller = storyboard
            .instantiateViewController(withIdentifier: "PlayerDetailViewController") as? PlayerDetailViewController
        guard let controller = controller else {
            return
        }
        controller.loadViewIfNeeded()
        let id = Int(playerArray[indexPath.row].id)
        controller.playerDetailViewModel.setplayerId(id: id)
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

// MARK: - TableView DataSource
extension SearchPlayer: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.SearchPlayerTableViewCell) as! SearchPlayerTableViewCell
        cell.playerName.text = playerArray[indexPath.row].fullName
        cell.playerImage.sd_setImage(with: URL(string: playerArray[indexPath.row].imagePath ?? ""), completed: nil)
        return cell
    }
}
