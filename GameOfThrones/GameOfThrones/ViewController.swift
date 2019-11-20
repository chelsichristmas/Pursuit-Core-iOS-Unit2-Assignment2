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
        
        guard let cellOdd = tableView.dequeueReusableCell(withIdentifier: "oddEpisode") as? EpisodeCell else {
            fatalError("Unable to dequeue oddCell")
        }
        
        guard let cellEven = tableView.dequeueReusableCell(withIdentifier: "evenEpisode") as? EpisodeCell else {
            fatalError("Unable to deque evenCell")
        }
        
        let episode = GOTSeasons[indexPath.section][indexPath.row]
        
        if episode.season % 2
            == 0 {
            cellEven.configureEvenCell(for: episode)
            return cellEven
        } else {
            cellOdd.configureOddCell(for: episode)
            return cellOdd
        }
        
        
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

