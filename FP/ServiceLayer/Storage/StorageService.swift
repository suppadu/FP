//
//  StorageService.swift
//  FP
//
//  Created by Дмитрий Константинов on 11.06.2021.
//

import Foundation
import CoreData

protocol StorageServiceProtocol {
    func saveShowedAnime(id: Int)
    func getNoShowedAnimeId() -> String
}

class StorageServiceCoreData{
    
    var persistentContainer: NSPersistentContainer!
    
    private enum Constants {
        static let containerName = "FP"
        static let showedAnime = "ShowedAnime"
    }
}

extension StorageServiceCoreData: StorageServiceProtocol{
    func getNoShowedAnimeId() -> String {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.showedAnime)
        
        return ""
    }
    
    func saveShowedAnime(id: Int) {
        guard persistentContainer != nil else {
            fatalError("Контейнер пуст")
        }
        
        let managedContext = persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: Constants.showedAnime, in: managedContext)!
        let anime = NSManagedObject(entity: entity, insertInto: managedContext)
        
        anime.setValue(id, forKey: "id")
        anime.setValue(true, forKey: "showed")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}


