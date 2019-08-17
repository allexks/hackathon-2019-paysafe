//
//  ActivityTableViewCell.swift
//  SkittleLittle
//
//  Created by Luboslav  Ivanov on 17.08.19.
//  Copyright © 2019 ApplePie. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    @IBOutlet weak var topMargin: NSLayoutConstraint!
    @IBOutlet weak var bottomMargin: NSLayoutConstraint!
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var budgetTypeLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var peopleStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let imageViewHeight = categoryImageView.bounds.height
        categoryImageView.roundCorners(cornerRadius: imageViewHeight / 2)
    }
    
    override func prepareForReuse() {
        peopleStackView.arrangedSubviews.forEach { $0.removeFromSuperview() } 
    }
    
    private func addPersonToStackView(_ person: Person) {
        let personImage = person.pic.rounded()
        let imageView = UIImageView(image: personImage)
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 21).isActive = true
        
        peopleStackView.addArrangedSubview(imageView)
    }
}

extension ActivityTableViewCell {
    func configure(with transaction: Transaction) {
        categoryImageView.image = transaction.category.image
        categoryTitleLabel.text = transaction.category.name
        budgetTypeLabel.text = transaction.budgetType.rawValue
        
        let priceSign = transaction.transactionType == .outcome ? "-" : ""
        priceLabel.text = "\(priceSign)\(transaction.value) BGN"
        
        transaction.people.forEach { addPersonToStackView($0, transaction: transaction) }
    }
    
    private func addPersonToStackView(_ person: Person, transaction: Transaction) {
        let personIndex = transaction.people.firstIndex {
            $0 === person
        }
        let hasPaid = transaction.hasPaid[personIndex!]
        
        let personImage = hasPaid ? UIImage(named: "tick-green")! : person.pic.rounded()
        
        let imageView = UIImageView(image: personImage)
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 21).isActive = true
    }
        
    func configure(with category: Category) {
        categoryImageView.image = category.image
        categoryTitleLabel.text = category.name

        
        budgetTypeLabel.isHidden = true
        priceLabel.isHidden = true
        peopleStackView.isHidden = true
    }
    
    func configure(with person: Person) {
        categoryImageView.image = person.pic
        categoryTitleLabel.text = person.name
        
        budgetTypeLabel.isHidden = true
        priceLabel.isHidden = true
        peopleStackView.isHidden = true
    }
}
