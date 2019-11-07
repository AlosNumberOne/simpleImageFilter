//
//  AddFilterViewController.swift
//  adjustBSC
//
//  Created by Appnap WS01 on 10/10/19.
//  Copyright © 2019 Appnap WS01. All rights reserved.
//

import UIKit
import Foundation
class AddFilterViewController: UITableViewController {
    
    var filtersModel: FiltersModel = FiltersModel()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allFilters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddFilterProto", for: indexPath)
        cell.textLabel?.text = allFilters[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = allFilters[indexPath.row]
        filtersModel.filters.append(selectedItem)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "FiltersUpdated"), object: nil)
        _ = self.navigationController?.popViewController(animated: true)
    }
}
