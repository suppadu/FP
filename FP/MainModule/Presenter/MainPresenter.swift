//
//  PresenterAboutAnime.swift
//  FP
//
//  Created by Дмитрий Константинов on 10.06.2021.
//

import Foundation
import UIKit

protocol MainViewProtocol {
    func setImageCover(data: Data)
    func pushNavBar(view: UIViewController)
}

protocol MainPresenterProtocol: AnyObject {
    init(view: MainViewController,
         networkService: NetworkService,
         storageService: StorageServiceCoreData)
    
    func getAnimePosters(amount: Int)
    func pushNavBar(view: UIViewController)
}

class MainPresenter: MainPresenterProtocol {
    
    let view: MainViewController
    let networkService: NetworkService
    let storageService: StorageServiceCoreData
    var animePosters = [Data]()
    var animes = [Anime]()
    
    required init(view: MainViewController,
                  networkService: NetworkService,
                  storageService: StorageServiceCoreData) {
        self.view = view
        self.networkService = networkService
        self.storageService = storageService
    }
    
    func getAnimePosters(amount: Int) {
        self.animePosters = []
        self.animes = []
        let imageGroup = DispatchGroup()
            for _ in 1...amount {
                imageGroup.enter()
                self.networkService.getAnime { anime in
                    self.animes.append(anime)
                    let stringUrl = anime.data?.attributes.posterImage?.original ?? "https://miro.medium.com/max/1956/1*pUEZd8z__1p-7ICIO1NZFA.png"
//                    let id = anime.data?.id ?? "0"
                    let url = URL(string: stringUrl)!
                    if let imageData = try? Data(contentsOf: url){
                        self.animePosters.append(imageData)
                        imageGroup.leave()
                    }
//                    self.view.setImageCover(data: imageData)
//                    self.storageService.saveShowedAnime(id: Int(id) ?? 0)
                }
                }
        imageGroup.notify(queue: DispatchQueue.main){
            self.view.collectionView.reloadData()
        }
    }
    
    func pushNavBar(view: UIViewController) {
        self.view.pushNavBar(view: view)
    }
}
