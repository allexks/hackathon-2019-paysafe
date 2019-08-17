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
    private let datePickerView = UIDatePicker()
    
    let people = [MockData.person1,
                  MockData.person2,
                  MockData.person3]
    
    var pickerAccessory: UIToolbar!
    
    var selectedTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerAccessory = UIToolbar()
        pickerAccessory?.autoresizingMask = .flexibleHeight
        
        //this customization is optional
        pickerAccessory?.barStyle = .default
        pickerAccessory?.barTintColor = .red
        pickerAccessory?.backgroundColor = .red
        
        var frame = pickerAccessory?.frame
        frame?.size.height = 44.0
        pickerAccessory?.frame = frame!
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel,
                                           target: self, action: #selector(cancelBtnClicked(_:)))
        cancelButton.tintColor = .white
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self, action: #selector(doneBtnClicked(_:)))
        doneButton.tintColor = .white
        
        //Add the items to the toolbar
        pickerAccessory?.items = [cancelButton, flexSpace, doneButton]
        
        dateTextField.inputAccessoryView = pickerAccessory
        reccurencyTextField.inputAccessoryView = pickerAccessory
        
        dateTextField.tag = 0
        reccurencyTextField.tag = 1
        
        recurrencyPickerView.delegate = self
        recurrencyPickerView.dataSource = self
        recurrencyPickerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        recurrencyPickerView.backgroundColor = .white
        
        reccurencyTextField.delegate = self
        reccurencyTextField.inputView = recurrencyPickerView
        
        datePickerView.datePickerMode = .date
        datePickerView.calendar = .current
        datePickerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        datePickerView.backgroundColor = .white
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        
        dateTextField.delegate = self
        dateTextField.inputView = datePickerView
        
        
        tableView.register(cellType: ActivityTableViewCell.self)
    }
    
    
    @objc func cancelBtnClicked(_ button: UIBarButtonItem?) {
        selectedTextField?.resignFirstResponder()
    }
    
    @objc func doneBtnClicked(_ button: UIBarButtonItem?) {
        selectedTextField?.resignFirstResponder()
        dateTextField.resignFirstResponder()

        
        if selectedTextField?.tag == 0 {
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "MMM dd yyyy"
            
            dateTextField.text = dateFormatterPrint.string(from: datePickerView.date)
        } else if selectedTextField?.tag == 1 {
            let index = recurrencyPickerView.selectedRow(inComponent: 0)
            reccurencyTextField.text = RecurrenceType.allCases[index].rawValue
        }
    }
    
    @objc func datePickerValueChanged() {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd yyyy"
        
        dateTextField.text = dateFormatterPrint.string(from: datePickerView.date)
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
    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedTextField = textField
    }
}
