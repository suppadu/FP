//
//  CollectionPresenter.swift
//  FP
//
//  Created by Дмитрий Константинов on 20.06.2021.
//

import Foundation
import UIKit

protocol CollectionViewProtocol {
    
}

protocol CollectionPresenterProtocol {
    
    init(mainView: MainViewController,
         mainPresenter: MainPresenter)
    
    func getCellsAmount() -> Int
    func setPosterImageView(indexPath: IndexPath) -> UIImage
    func pushNavBar(view: UIViewController)
}

class CollectionPresenter: CollectionPresenterProtocol {
    
    let mainView: MainViewController
    let mainPresenter: MainPresenter
    
    required init(mainView: MainViewController,
                  mainPresenter: MainPresenter) {
        self.mainView = mainView
        self.mainPresenter = mainPresenter
    }
    
    func getCellsAmount() -> Int {
        return self.mainPresenter.animePosters.count
    }
    
    func setPosterImageView(indexPath: IndexPath) -> UIImage {
        if self.mainPresenter.animePosters.count != 0{
            return UIImage(data: self.mainPresenter.animePosters[indexPath.row])!
        }
        else {
            return UIImage()
        }
    }
    
    func pushNavBar(view: UIViewController) {
        self.mainPresenter.pushNavBar(view: view)
    }
}
