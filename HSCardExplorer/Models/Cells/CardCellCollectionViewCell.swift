//
//  CardCellCollectionViewCell.swift
//  Redux
//
//  Created by Erik Tollefsrud on 1/16/20.
//  Copyright © 2020 Erik Tollefsrud. All rights reserved.
//

import UIKit

class CardCellCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "CardCell"
    let cardImageView = HSCardImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(cardImageView)
        
        let padding:CGFloat = 0
        //layer.backgroundColor = UIColor.red.cgColor
        
        NSLayoutConstraint.activate([
            cardImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            cardImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            cardImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            cardImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        ])
    }
    
    func set(card: HSCard) {
        cardImageView.downloadCardImage(from: card.id)
    }
}
