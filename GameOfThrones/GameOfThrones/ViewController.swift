//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var GOTSeasons = [[GOTEpisode]]() {
        didSet {
            tableView.reloadData()
        }
    }
  override func viewDidLoad() {
    
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    loadData()

  }
    
    func loadData() {
        GOTSeasons = GOTEpisode.seasonSections()
    }


}
extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GOTSeasons[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as? EpisodeCell else {
            fatalError("Unable to dequeue cell")
        }
        
        let episode = GOTSeasons[indexPath.section][indexPath.row]
        cell.configureCell(for: episode)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return GOTSeasons.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(GOTSeasons[section].first!.season)"
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
}

