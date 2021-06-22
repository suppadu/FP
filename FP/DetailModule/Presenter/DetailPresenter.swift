//
//  DetailPresenter.swift
//  FP
//
//  Created by Дмитрий Константинов on 21.06.2021.
//

import Foundation
import UIKit

protocol DetailViewProtocol: AnyObject {
    func setAnime(anime: Anime)
    func setBackgroundImage(image: UIImage)
}

protocol DetailPresenterProtocol {
    init(view: DetailViewProtocol, anime: Anime, bgImage: UIImage)
    
    func getAnime()
    func getBgImage()
}

class DetailPresenter: DetailPresenterProtocol {
        
    weak var view: DetailViewProtocol?
    let anime: Anime
    let bgImage: UIImage
    
    required init(view: DetailViewProtocol, anime: Anime, bgImage: UIImage) {
        self.view = view
        self.anime = anime
        self.bgImage = bgImage
    }
    
    func getAnime() {
        self.view?.setAnime(anime: self.anime)
    }
    
    func getBgImage() {
        self.view?.setBackgroundImage(image: self.bgImage)
    }
}
