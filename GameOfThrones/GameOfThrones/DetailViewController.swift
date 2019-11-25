//
//  DetailViewController.swift
//  GameOfThrones
//
//  Created by Chelsi Christmas on 11/22/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    
    @IBOutlet weak var episodeLabel: UILabel!
    
    @IBOutlet weak var airDateLabel: UILabel!
    
    
    @IBOutlet weak var infoLabel: UITextView!
    
    var episode: GOTEpisode?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    

    func updateUI() {
            imageView.image = UIImage(named: episode!.originalImageID)
        titleLabel.text = episode!.name
    seasonLabel.text = "Season: \(episode!.season)"
        runtimeLabel.text = "Runtime: \(episode!.runtime)"
        episodeLabel.text = "Episode:  \(episode!.number)"
        airDateLabel.text = "Airdate: \(episode!.airdate) "
        infoLabel.text = episode!.summary
        
        
        
    }

}
