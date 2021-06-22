//
//  EndPoint.swift
//  FP
//
//  Created by Дмитрий Константинов on 09.06.2021.
//

import Foundation

protocol NetworkServiceProtocol {
        
    func getAnime(complit: @escaping (_ anime: Anime) -> Void)
    func getNoShowedAnimeId()
}

class NetworkService: NetworkServiceProtocol {
    func getNoShowedAnimeId() {
        //
    }
    
    private let storageService: StorageServiceCoreData! = nil
    
    func getAnime(complit: @escaping (_ anime: Anime) -> Void) {
        let rnd = String(Int.random(in: 1...100))
        let url = URL(string: "https://kitsu.io/api/edge/anime/" + rnd)
        let request = URLRequest(url: url!)
        URLSession.shared.dataTask(with: request) { data, response, error in
            let httpStatus = response as? HTTPURLResponse
            let code = httpStatus?.statusCode
                guard let data = data else { return }
                do {
                    let anime = try JSONDecoder().decode(Anime.self, from: data)
                    complit(anime)
                } catch let error {
                    print(error)
                }
            print("statusCode: \(code ?? 999)")
            print("Nomer anime: \(rnd)")
        }.resume()
    }
}

