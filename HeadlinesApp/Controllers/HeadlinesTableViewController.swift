//
//  HeadlinesTableViewController.swift
//  HeadlinesApp
//
//  Created by Mohammad Azam on 12/16/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class HeadlinesTableViewController : UITableViewController {
    
    var sourceViewModel :SourceViewModel!
    private var headlineListViewModel :HeadlineListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    private func updateUI() {
        
        self.title = self.sourceViewModel.name
        
        self.headlineListViewModel = HeadlineListViewModel(sourceViewModel: self.sourceViewModel) {
            self.tableView.reloadData()
        }
     
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.headlineListViewModel != nil {
            return self.headlineListViewModel.headlineViewModels.count
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HeadlineTableViewCell
        
        let headlineViewModel = self.headlineListViewModel.headlineAt(index: indexPath.row)
        
        cell.titleLabel.text = headlineViewModel.title
        cell.descriptionLabel.text = headlineViewModel.description
        
        return cell
    }
    
}
