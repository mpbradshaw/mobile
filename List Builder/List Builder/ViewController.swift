//
//  ViewController.swift
//  List Builder
//
//  Created by Matt Bradshaw on 3/8/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        cell.textLabel?.text = self.items[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

            if editingStyle == .delete {

                // remove the item from the data model
                items.remove(at: indexPath.row)
                prices.remove(at: indexPath.row)

                // delete the table view row
                tableView.deleteRows(at: [indexPath], with: .fade)

            }
    }
    
    @IBOutlet var itemView: UITableView!
    @IBOutlet var priceView: UITableView!
    @IBOutlet var submitButton: UIButton!
    var items = [String]()
    var prices = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        itemView.delegate = self
        itemView.dataSource = self
        priceView.delegate = self
        priceView.dataSource = self
    }


}

