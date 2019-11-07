//
//  selectFilterViewController.swift
//  adjustBSC
//
//  Created by Appnap WS01 on 10/10/19.
//  Copyright © 2019 Appnap WS01. All rights reserved.
//

import UIKit

class selectFilterViewController: UIViewController, UITableViewDataSource{
    //let data: [String] = ["filter 1", "filter 2"]
    var filterModel : FiltersModel = FiltersModel()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isEditing = true

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return data.count
        return filterModel.filters.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath)
        cell.textLabel?.text = filterModel.filters[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if ( editingStyle == UITableViewCell.EditingStyle.delete ){
            filterModel.filters.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
      func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = filterModel.filters [sourceIndexPath.row]
        filterModel.filters.remove(at: sourceIndexPath.row)
        filterModel.filters.insert(item, at: destinationIndexPath.row)
        tableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
