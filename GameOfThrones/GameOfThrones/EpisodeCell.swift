//
//  EpisodeCell.swift
//  GameOfThrones
//
//  Created by Chelsi Christmas on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell {

    @IBOutlet weak var episodeImageView: UIImageView!
    
    @IBOutlet weak var episodeTitleLabel: UILabel!
    
    @IBOutlet weak var episodeSeasonAndEpisodeLabel: UILabel!
    
    func configureCell(for episode: GOTEpisode) {
        episodeImageView.image = UIImage(named: episode.mediumImageID)
        episodeTitleLabel.text = episode.name
        episodeSeasonAndEpisodeLabel.text = "S:\(episode.season) E:\(episode.number)"
    }
}
