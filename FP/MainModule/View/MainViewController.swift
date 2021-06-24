//
//  ViewController.swift
//  FP
//
//  Created by Дмитрий Константинов on 08.06.2021.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    //MARK: - Variable
    //    объявление переменных для элементов интерфейса и презентера
    var collectionView: CollectionView!
    var presenter: MainPresenterProtocol!
    override var canBecomeFirstResponder: Bool { get { return true } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        //        верстка UI
        self.view.backgroundColor = .white
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.width.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        //        загрузка из сети 5 постеров для аниме. Внутри метода
        //        выполняется запрос к сетевому слою (внутри которого происходит
        //        загрузка и парсинг), после этого из полученной модели
        //        берется адрес для загрузки постера, создается Data и помещается
        //        в массив постеров. После загрузки всех постеров делается релоад коллекции
        self.presenter.getAnimePosters(amount: 5)
    }
//    функция для остлеживание когда закончат трясти смартфон
//    если телефон трясли, вызывается загрузка из сети 5 постеров для аниме
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            print("shake")
            self.presenter.getAnimePosters(amount: 5)
        }
    }
}

extension MainViewController: MainViewProtocol{
    func pushNavBar(view: UIViewController) {
        navigationController?.pushViewController(view, animated: true)
    }
}

