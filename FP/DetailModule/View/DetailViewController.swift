//
//  DetailViewController.swift
//  FP
//
//  Created by Дмитрий Константинов on 21.06.2021.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    let largeTitle = UILabel()
    let descriptionAnime = UILabel()
    let backgroundImage = UIImageView()
    var presenter: DetailPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        self.presenter.getBgImage()
    }
}

extension DetailViewController: DetailViewProtocol{
    func setAnime(anime: Anime) {
        
    }
    
    func setBackgroundImage(image: UIImage) {
        self.backgroundImage.image = image
    }
}
