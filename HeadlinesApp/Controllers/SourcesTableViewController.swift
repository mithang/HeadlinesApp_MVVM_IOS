//
//  SourcesTableViewController.swift
//  HeadlinesApp
//
//  Created by Mohammad Azam on 12/8/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class SourcesTableViewController : UITableViewController {
    
    private var webservice :Webservice!
    private var sourceListViewModel :SourceListViewModel!
    private var dataSource :TableViewDataSource<SourceTableViewCell,SourceViewModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webservice = Webservice()
        self.sourceListViewModel = SourceListViewModel(webservice: self.webservice) {
            
            self.dataSource = TableViewDataSource(cellIdentifier: "Cell", items: self.sourceListViewModel.sourcesViewModel) { cell, vm in
                
                cell.titleLabel.text = vm.name
                cell.descriptionLabel.text = vm.description
            }
            
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let headlinesTVC = segue.destination as? HeadlinesTableViewController else {
            fatalError("HeadlinesTableViewController not found")
        }
        
        let indexPath = (self.tableView.indexPathForSelectedRow)!
        let sourceViewModel = self.sourceListViewModel.sourceAt(index: indexPath.row)
        
        headlinesTVC.sourceViewModel = sourceViewModel
        
    }
   
}








