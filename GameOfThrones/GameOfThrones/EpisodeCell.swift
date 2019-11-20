//
//  EpisodeCell.swift
//  GameOfThrones
//
//  Created by Chelsi Christmas on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell {

    @IBOutlet weak var episodeImageView1: UIImageView!
    
    @IBOutlet weak var episodeTitleLabel1: UILabel!
    
    
    @IBOutlet weak var episodeSeasonAndEpisodeLabel1: UILabel!
    
    
    
    @IBOutlet weak var episodeImageView2: UIImageView!
    
    @IBOutlet weak var episodeTitleLabel2: UILabel!
    
    
    @IBOutlet weak var episodeSeasonAndEpisodeLabel2: UILabel!
    
    
    func configureOddCell(for episode: GOTEpisode) {
        episodeImageView1.image = UIImage(named: episode.mediumImageID)
        episodeTitleLabel1.text = episode.name
        episodeSeasonAndEpisodeLabel1.text = "S:\(episode.season) E:\(episode.number)"
    }
    
    func configureEvenCell(for episode: GOTEpisode) {
        episodeImageView2.image = UIImage(named: episode.mediumImageID)
        episodeTitleLabel2.text = episode.name
        episodeSeasonAndEpisodeLabel2.text = "S:\(episode.season) E:\(episode.number)"
    }
}
