//
//  ViewControllerExtension.swift
//  Cricket_Info
//
//  Created by bjit on 13/2/23.
//

import Foundation
import UIKit

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)

        if viewModel.matchDataLive.value?.data?.count ?? 0 > 0 {
            viewModel.navigateToViewControllerLive(viewController: self, index: indexPath.row)
        }
        else {
            viewModel.navigateToViewControllerUpcoming(viewController: self, index: indexPath.row)
        }
        //navigateToViewControllerUpcoming(index: indexPath.row)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return viewModel.matchDataUpcoming.value?.data?.count ?? 0
        if viewModel.matchDataLive.value?.data?.count ?? 0 > 0 {
            return viewModel.matchDataLive.value?.data?.count ?? 0
        }
        else {
            return viewModel.matchDataUpcoming.value?.data?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.LiveNibCell, for: indexPath) as! LiveMatchCollectionViewCell
//        cell.leagueName.text = viewModel.matchDataUpcoming.value?.data?[indexPath.row].league?.name
//        cell.venue.text = viewModel.matchDataUpcoming.value?.data?[indexPath.row].venue?.name
//        cell.team1Name.text = viewModel.matchDataUpcoming.value?.data?[indexPath.row].localteam?.name
//        cell.team2Name.text = viewModel.matchDataUpcoming.value?.data?[indexPath.row].visitorteam?.name
//        cell.team1Flag.sd_setImage(with: URL(string: viewModel.matchDataUpcoming.value?.data?[indexPath.row].localteam?.image_path ?? ""), completed: nil)
//        cell.team2Flag.sd_setImage(with: URL(string: viewModel.matchDataUpcoming.value?.data?[indexPath.row].visitorteam?.image_path ?? ""), completed: nil)
//        if viewModel.matchDataUpcoming.value?.data?[indexPath.row].status == "NS" {
//
//            cell.matchStatus.text = SharedClass.shared.cutString(startIndex: 0, offset: 10, originalString: viewModel.matchDataUpcoming.value?.data?[indexPath.row].starting_at ?? "")
//            cell.matchStatus.textColor = .black
//            cell.timeLabel.text = SharedClass.shared.cutString(startIndex: 12, offset: 4, originalString: viewModel.matchDataUpcoming.value?.data?[indexPath.row].starting_at ?? "")
//            cell.team1Over.text = ""
//            cell.team1Score.text = ""
//            cell.team2Over.text = ""
//            cell.team2Score.text = ""
//            cell.matchResult.text = viewModel.matchDataUpcoming.value?.data?[indexPath.row].round
//        }
//        else {
//            cell.matchStatus.text = "Live"
//        }
//        return cell
        
        
        
        if viewModel.matchDataLive.value?.data?.count ?? 0 > 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.LiveNibCell, for: indexPath) as! LiveMatchCollectionViewCell
            observeTeamWiseRunForLive(index: indexPath.row)
            if flag2 == false {
                DispatchQueue.main.async { [weak self] in
                    self?.collectionView.reloadData()
                }
                flag2 = true
            }
            
            cell.leagueName.text = viewModel.matchDataLive.value?.data?[indexPath.row].league?.name
            cell.venue.text = viewModel.matchDataLive.value?.data?[indexPath.row].venue?.name
            cell.team1Name.text = viewModel.matchDataLive.value?.data?[indexPath.row].localteam?.name
            cell.team2Name.text = viewModel.matchDataLive.value?.data?[indexPath.row].visitorteam?.name
            cell.team1Flag.sd_setImage(with: URL(string: viewModel.matchDataLive.value?.data?[indexPath.row].localteam?.image_path ?? ""), completed: nil)
            cell.team2Flag.sd_setImage(with: URL(string: viewModel.matchDataLive.value?.data?[indexPath.row].visitorteam?.image_path ?? ""), completed: nil)
            
            
            cell.matchStatus.text = SharedClass.shared.cutString(startIndex: 0, offset: 10, originalString: viewModel.matchDataLive.value?.data?[indexPath.row].starting_at ?? "")
            cell.matchStatus.textColor = .red
            cell.timeLabel.text = ""
            cell.team1Over.text = "(\(over1 ?? 0.0) ov)"
            cell.team1Score.text = "\(String(run1 ?? 0))/\(String(wicket1 ?? 0))"
            cell.team2Over.text = "(\(over2 ?? 0.0) ov)"
            cell.team2Score.text = "\(String(run2 ?? 0))/\(String(wicket2 ?? 0))"
            cell.matchResult.text = viewModel.matchDataLive.value?.data?[indexPath.row].round
            
            cell.matchStatus.text = "Live"
            return cell
        }
        
        else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.LiveNibCell, for: indexPath) as! LiveMatchCollectionViewCell
            
            cell.leagueName.text = viewModel.matchDataUpcoming.value?.data?[indexPath.row].league?.name
            cell.venue.text = viewModel.matchDataUpcoming.value?.data?[indexPath.row].venue?.name
            cell.team1Name.text = viewModel.matchDataUpcoming.value?.data?[indexPath.row].localteam?.name
            cell.team2Name.text = viewModel.matchDataUpcoming.value?.data?[indexPath.row].visitorteam?.name
            cell.team1Flag.sd_setImage(with: URL(string: viewModel.matchDataUpcoming.value?.data?[indexPath.row].localteam?.image_path ?? ""), completed: nil)
            cell.team2Flag.sd_setImage(with: URL(string: viewModel.matchDataUpcoming.value?.data?[indexPath.row].visitorteam?.image_path ?? ""), completed: nil)
            cell.matchStatus.text = SharedClass.shared.cutString(startIndex: 0, offset: 10, originalString: viewModel.matchDataUpcoming.value?.data?[indexPath.row].starting_at ?? "")
            cell.matchStatus.textColor = .black
            cell.timeLabel.text = SharedClass.shared.cutString(startIndex: 12, offset: 4, originalString: viewModel.matchDataUpcoming.value?.data?[indexPath.row].starting_at ?? "")
            cell.team1Over.text = ""
            cell.team1Score.text = ""
            cell.team2Over.text = ""
            cell.team2Score.text = ""
            cell.matchResult.text = viewModel.matchDataUpcoming.value?.data?[indexPath.row].round
            return cell
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        viewModel.navigateToViewControllerRecent(viewController: self, index: indexPath.row)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y > 0 {
            
            UIView.animate(withDuration: 0.4) { [weak self] in
                self?.collectionView.isHidden = true
                self?.topConstraint.constant = -200
                self?.view.layoutIfNeeded()
            }
        }
        else {
            UIView.animate(withDuration: 0.4) { [weak self] in
                self?.collectionView.isHidden = false
                self?.topConstraint.constant = 10
                self?.view.layoutIfNeeded()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.matchData.value?.data?.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.cell) as! TableViewCell
        cell.bgView.setShadow()
        observeTeamWiseRun(index: indexPath.row)
        if flag == false {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
            flag = true
        }
        
        cell.leagueName.text = viewModel.matchData.value?.data?[indexPath.row].league?.name
        cell.round.text = viewModel.matchData.value?.data?[indexPath.row].stage?.name

        cell.team1Name.text = viewModel.matchData.value?.data?[indexPath.row].localteam?.name
        cell.team2Name.text = viewModel.matchData.value?.data?[indexPath.row].visitorteam?.name

        cell.team1Score.text = "\(String(run1 ?? 0))/\(String(wicket1 ?? 0))"
        cell.team2Score.text = "\(String(run2 ?? 0))/\(String(wicket2 ?? 0))"
        cell.matchResult.text = viewModel.matchData.value?.data?[indexPath.row].note
        cell.team1Over.text = "(\(over1 ?? 0.0) ov)"
        cell.team2Over.text = "(\(over2 ?? 0.0) ov)"

        cell.team1Flag.sd_setImage(with: URL(string: viewModel.matchData.value?.data?[indexPath.row].localteam?.image_path ?? ""), completed: nil)
        cell.team2Flag.sd_setImage(with: URL(string: viewModel.matchData.value?.data?[indexPath.row].visitorteam?.image_path ?? ""), completed: nil)
       

        return cell
    }
}
