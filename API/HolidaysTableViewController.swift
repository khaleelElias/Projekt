//
//  HolidaysTableViewController.swift
//  API
//
//  Created by Fahed Yousif on 2019-11-25.
//  Copyright © 2019 khaleel Elias. All rights reserved.
//

import UIKit

class HolidaysTableViewController: UITableViewController {
    
    
    var listOfHolidays = [HolidayDetails]() {
        
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "\(self.listOfHolidays.count) Holidays found"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //req
        let holidayRequest = HolidayRequest(countryCode: "Se")
        holidayRequest.getHolidays { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let holidays):
                self?.listOfHolidays = holidays
            }
        }
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfHolidays.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let holiday = listOfHolidays[indexPath.row]
        cell.textLabel?.text = holiday.name
        cell.detailTextLabel?.text = holiday.date.iso
        
        return cell
    }


}

