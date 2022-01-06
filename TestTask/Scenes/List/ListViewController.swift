//
//  ListViewController.swift
//  TestTask
//
//  Created by Sasha Riabchuk on 03.01.2022.
//

import UIKit

class ListViewController: UIViewController, ListDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ListViewModel?
    var cats = [Cats]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel?.delegate = self
        viewModel?.getCats()
    }
    
    func reload(with data: [Cats]) {
        DispatchQueue.global().async {
            self.cats = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CatTableViewCell
        
        cell.idLabel.text = cats[indexPath.row].id
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.openDetail(with: cats[indexPath.row])
    }
    
}
