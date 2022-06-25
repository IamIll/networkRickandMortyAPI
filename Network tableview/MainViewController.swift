//
//  MainViewController.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 15.06.2022.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, TableDelegate {
    
    @IBOutlet var table: UITableView!
    
    var tableDS = TableDS()
    var index: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableDS.fetchData()
        table.dataSource = tableDS
        table.delegate = self
        tableDS.delegate = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath
        performSegue(withIdentifier: "GoDetail", sender: nil)
        }
    
    func update() {
        DispatchQueue.main.async {
            self.table.reloadData()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let index = index {
            let detailVC = segue.destination as! DetailController
            detailVC.detailCharacter = tableDS.dateAPI?.results[index.row]
        }
    }
    
}
