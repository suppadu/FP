//
//  Builder.swift
//  FP
//
//  Created by Дмитрий Константинов on 11.06.2021.
//

import UIKit
import CoreData

protocol BuilderProtocol {
    static func createMainView() -> UIViewController
    static func createDetailView(anime: Anime, bgImage: UIImage) -> UIViewController
    func getContainer(persistentContainer: NSPersistentContainer)
}

class Builder: BuilderProtocol {
    
    static var container: NSPersistentContainer!
    static let collectionView = CollectionView()
    
    func getContainer(persistentContainer: NSPersistentContainer){
        Builder.container = persistentContainer
    }
    
    static func createMainView() -> UIViewController {
        let networkService = NetworkService()
        let storageService = StorageServiceCoreData()
        let view = MainViewController()
        let presenter = MainPresenter(view: view,
                                            networkService: networkService,
                                            storageService: storageService)
        let collectionPresenter = CollectionPresenter(mainView: view,
                                                      mainPresenter: presenter)
        view.presenter = presenter
        self.collectionView.collectionPresenter = collectionPresenter
        storageService.persistentContainer = self.container
        return view
    }
    
    static func createDetailView(anime: Anime, bgImage: UIImage) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, anime: anime, bgImage: bgImage)
        view.presenter = presenter
        return view
    }
}
