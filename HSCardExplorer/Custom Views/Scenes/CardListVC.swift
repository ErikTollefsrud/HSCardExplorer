//
//  CardListVC.swift
//  Redux
//
//  Created by Erik Tollefsrud on 1/16/20.
//  Copyright © 2020 Erik Tollefsrud. All rights reserved.
//

import UIKit

class CardListVC: UIViewController {
    
    enum Section {
        case main
    }
    
    var cards: HSCards = []
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, HSCard>!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        configureCollectionView()
        getCards()
        configureDataSource()
    }
    
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground

        collectionView.register(CardCellCollectionViewCell.self, forCellWithReuseIdentifier: CardCellCollectionViewCell.reuseID)
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, HSCard>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, card) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCellCollectionViewCell.reuseID, for: indexPath) as? CardCellCollectionViewCell else { fatalError("Could not create cell.")}
            cell.set(card: card)
            return cell
        })
    }
    
    func getCards() {
        NetworkManager.shared.getCards { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let recievedCards):
                self.cards.append(contentsOf: recievedCards)
                self.updateData(on: recievedCards)
            case .failure(let error):
                print("Error: Bad stuff Happened - \(error)")
            }
            
        }
    }
    
    func updateData(on cards: HSCards) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, HSCard>()
        snapshot.appendSections([.main])
        snapshot.appendItems(cards)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
    }

}

extension CardListVC: UICollectionViewDelegate {
    
    
}
