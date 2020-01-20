//
//  CardTableVC.swift
//  Redux
//
//  Created by Erik Tollefsrud on 12/31/19.
//  Copyright © 2019 Erik Tollefsrud. All rights reserved.
//

import UIKit

class CardTableVC: UIViewController {
    
    let cardTable = UITableView()
    var cardsArray: [HSCard] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGreen
        configureCardTableView()
        downloadCards()
    }
    
    func configureCardTableView() {
        view.addSubview(cardTable)
        cardTable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cardTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cardTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cardTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        cardTable.delegate = self
        cardTable.dataSource = self
    }
    
    func downloadCards() {
        NetworkManager.shared.getCards { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let cards):
                print(cards)
                self.cardsArray = cards
                DispatchQueue.main.async{ self.cardTable.reloadData() }
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }

}

extension CardTableVC: UITableViewDelegate {
    
}

extension CardTableVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cardsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(frame: CGRect(x: 0, y: 0, width: 300, height: 44))
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        cell.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: cell.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 10),
        ])
        label.text = cardsArray[indexPath.item].name + ": " + (cardsArray[indexPath.item].hsCardSet?.rawValue ?? "")
        
        
        if indexPath[1] % 2 == 0 {
            cell.backgroundColor = .systemBlue
        } else {
            cell.backgroundColor = .systemPurple
        }
        return cell
    }
    
    
}
