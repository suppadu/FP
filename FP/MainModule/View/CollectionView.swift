//
//  TestCollectionViewController.swift
//  FP
//
//  Created by Дмитрий Константинов on 18.06.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionView: UICollectionView {
    
    var cells = [Anime]()
    var collectionPresenter: CollectionPresenter!
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .clear
        delegate = self
        dataSource = self
        register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseID)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: UICollectionViewDataSource

extension CollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionPresenter.getCellsAmount() != 0{
            return collectionPresenter.getCellsAmount()
        }
        else {
            return 1
        }
            
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseID, for: indexPath) as! CollectionViewCell
        cell.posterImageView.image = collectionPresenter.setPosterImageView(indexPath: indexPath)
        return cell
    }
}

// MARK: UICollectionViewDelegate

extension CollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let bgImage = collectionPresenter.setPosterImageView(indexPath: indexPath)
        let detailViewController = Builder.createDetailView(anime: Anime(), bgImage: bgImage)
        self.collectionPresenter.mainView.pushNavBar(view: detailViewController)
    }
}

extension CollectionView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 284, height: 402)
    }
}
