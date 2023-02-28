//
//  DetailViewController.swift
//  Cricket_Info
//
//  Created by bjit on 17/2/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    var flag = 0
    var id: Int?
    var fixId: Int?
    var localteam: String?
    var visitorTeam: String?
    var detailModel = DetailViewModel()
    
    @IBOutlet weak var matchInfoContainerView: UIView!
    
    @IBOutlet weak var squadContainerView: UIView!
    
    @IBOutlet weak var scoreboardContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        squadContainerView.isHidden = true
        scoreboardContainerView.isHidden = true
        matchInfoContainerView.isHidden = false
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == Identifiers.detailsToInfo {
            let destVC = segue.destination as! InfoViewController
            destVC.fixtureID = fixId ?? 0
        }
        if segue.identifier == Identifiers.detailsToSquad {
            let destVC = segue.destination as! SquadViewController
            destVC.fixtureID = fixId ?? 0
            destVC.localteam = localteam
            destVC.visitorTeam = visitorTeam
        }

        if segue.identifier == Identifiers.detailsToScoreboard {
            let destVC = segue.destination as! ScoreboardViewController
            destVC.fixtureId = fixId ?? 0
            destVC.localteam = localteam
            destVC.visitorTeam = visitorTeam
        }
    }
    

    @IBAction func didTapSegment(segment: UISegmentedControl) {
        
        if segment.selectedSegmentIndex == 0 {
            
            squadContainerView.isHidden = true
            scoreboardContainerView.isHidden = true
            matchInfoContainerView.isHidden = false
        }
        else if segment.selectedSegmentIndex == 1 {
            print("Second VC")
       
            squadContainerView.isHidden = false
            matchInfoContainerView.isHidden = true
            scoreboardContainerView.isHidden = true
        }
        else {
            print("Third VC")
            squadContainerView.isHidden = true
            matchInfoContainerView.isHidden = true
            scoreboardContainerView.isHidden = false
        }
    }
    
}
