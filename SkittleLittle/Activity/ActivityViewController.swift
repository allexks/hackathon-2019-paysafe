//
//  ActivityViewController.swift
//  SkittleLittle
//
//  Created by Luboslav  Ivanov on 17.08.19.
//  Copyright © 2019 ApplePie. All rights reserved.
//

import UIKit
import Foundation


class ActivityViewController: UIViewController {
    
    private let dataModel = PersonalTransactions.shared
    private var transactionsData: [[Transaction]] = []
    
    @IBOutlet weak var wantsSpendLabel: UILabel!
    @IBOutlet weak var wantsValuePerDayLabel: UILabel!
    
    @IBOutlet weak var needsSpendLabel: UILabel!
    @IBOutlet weak var needsValuePerDayLabel: UILabel!
    
    @IBOutlet weak var investsSpendLabel: UILabel!
    @IBOutlet weak var investsValuePerDayLabel: UILabel!
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SkittleLittle"
        
        tableView.register(cellType: ActivityTableViewCell.self)
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        investsSpendLabel.text = "LIMIT"
        investsValuePerDayLabel.text = "REACHED"
        parseDataModel()
    }
    
    private func parseDataModel() {
        let dict = dataModel.transactionsGroupedByDate
        let dates = dict.keys.sorted(by: <)
        var result: [[Transaction]] = []
        
        dates.forEach {
            result.append(dict[$0]!)
        }
        
        transactionsData = result
    }
    
    
}


extension ActivityViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return transactionsData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionsData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: ActivityTableViewCell.self, for: indexPath)
        
        cell.configure(with: transactionsData[indexPath.section][indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd, yyyy"
        
        let date = transactionsData[section].first!.datetime
        return dateFormatterPrint.string(from: date)
    }
}

extension ActivityViewController: UITableViewDelegate {
    
}
