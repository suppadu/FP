//
//  ViewController.swift
//  FP
//
//  Created by Дмитрий Константинов on 08.06.2021.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let scroll = UIScrollView()
    let presentView = UIView()
    let coverImage = UIImageView()
    let collectionView = Builder.collectionView
    let btn = UIButton()
    var presenter: MainPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
//        self.view.addSubview(self.scroll)
//        scroll.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//        self.scroll.addSubview(presentView)
//        presentView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//            make.height.equalToSuperview()
//        }
        self.view.addSubview(collectionView)
        self.becomeFirstResponder()
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.width.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
//        self.scroll.addSubview(btn)
//        btn.backgroundColor = .white
//        btn.setTitle("test", for: .normal)
//        btn.snp.makeConstraints { make in
//            make.top.equalTo(collectionView.snp.bottom)
//            make.height.width.equalTo(40)
//        }
//        btn.addTarget(self, action: #selector(showCover), for: .touchUpInside)
        self.presenter.getAnimePosters(amount: 5)
    }
    
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
            if motion == .motionShake {
                print("shake")
                self.presenter.getAnimePosters(amount: 5)
            }
        }
    
//    @objc
//    func showCover(){
//        self.presenter.getAnimePosters(amount: 5)
//    }
}

extension MainViewController: MainViewProtocol{
    func pushNavBar(view: UIViewController) {
        navigationController?.pushViewController(view, animated: true)
    }
    
    func setImageCover(data: Data) {
        DispatchQueue.main.async {
            self.coverImage.image = UIImage(data: data)
        }
    }
}

