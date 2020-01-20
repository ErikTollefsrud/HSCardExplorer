//
//  CardFilterButton.swift
//  Redux
//
//  Created by Erik Tollefsrud on 1/17/20.
//  Copyright © 2020 Erik Tollefsrud. All rights reserved.
//

import UIKit

class CardFilterButton: UIButton {
    
    let placeHolderImage            = UIImage(named: "hearthstone-placeholder")
    var buttonImage: UIImage?
    lazy var buttonImageDeselected  = self.buttonImage?.noir

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(withImageName name: String) {
        super.init(frame: .zero)
        self.buttonImage = UIImage(named: name)
        configure()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        self.setImage(buttonImage, for: .normal)
        self.setImage(buttonImageDeselected, for: .selected)
        self.setImage(buttonImageDeselected, for: .highlighted)
        
        // This makes sure that the button image remains square
        // Could probably break this out into it's own thing; like 'button.keepImageAspectRatio = true'
        if let imageView = imageView {
            if imageView.frame.width > imageView.frame.height {
                imageView.contentMode = .scaleAspectFill
            } else {
                imageView.contentMode = .scaleAspectFit
            }
        }
        
        addTarget(self, action: #selector(toggleSelected), for: .touchUpInside)
        
    }
    
    @objc func toggleSelected() {
        isSelected.toggle()
    }

}
