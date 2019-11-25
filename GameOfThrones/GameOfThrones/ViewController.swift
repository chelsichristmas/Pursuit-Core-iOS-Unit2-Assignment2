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
    
    
    var GOTEpisodes = [[GOTEpisode]]() {
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
        GOTEpisodes = GOTEpisode.seasonSections()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
        fatalError("Unable to access Detail View Controller")
        }
        
        let episodes = GOTEpisodes[indexPath.section][indexPath.row]
        detailViewController.episode = episodes
        
        
        
    }

}
extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GOTEpisodes[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellOdd = tableView.dequeueReusableCell(withIdentifier: "oddEpisode") as? EpisodeCell else {
            fatalError("Unable to dequeue oddCell")
        }
        
        guard let cellEven = tableView.dequeueReusableCell(withIdentifier: "evenEpisode") as? EpisodeCell else {
            fatalError("Unable to deque evenCell")
        }
        
        let episode = GOTEpisodes[indexPath.section][indexPath.row]
        
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
       return GOTEpisodes.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(GOTEpisodes[section].first!.season)"
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
}

