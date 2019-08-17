//
//  TransactionDetailsTableViewController.swift
//  SkittleLittle
//
//  Created by Luboslav  Ivanov on 17.08.19.
//  Copyright © 2019 ApplePie. All rights reserved.
//

import UIKit

class TransactionDetailsTableViewController: UITableViewController {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var budgetType: UISegmentedControl!
    
    @IBOutlet weak var amountImageView: UIImageView!
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var dateImageView: UIImageView!
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var reccurencyImageView: UIImageView!
    @IBOutlet weak var reccurencyTextField: UITextField!
    
    private let recurrencyPickerView = UIPickerView()
    
    let people = [MockData.person1,
                  MockData.person2,
                  MockData.person3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recurrencyPickerView.delegate = self
        recurrencyPickerView.dataSource = self
        recurrencyPickerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        recurrencyPickerView.backgroundColor = .white
        
        reccurencyTextField.delegate = self
        reccurencyTextField.inputView = recurrencyPickerView
        
        tableView.register(cellType: ActivityTableViewCell.self)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: ActivityTableViewCell.self, for: indexPath)
        cell.configure(with: people[indexPath.section])
        return cell
    }
}

extension TransactionDetailsTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return RecurrenceType.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return RecurrenceType.allCases[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        reccurencyTextField.text = RecurrenceType.allCases[row].rawValue
    }
}


extension TransactionDetailsTableViewController: UITextFieldDelegate {
    
}
