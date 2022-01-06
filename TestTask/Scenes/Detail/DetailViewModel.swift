//
//  DetailViewModel.swift
//  TestTask
//
//  Created by Sasha Riabchuk on 06.01.2022.
//

import Foundation
import SDWebImage

class DetailViewModel {
    weak var coordinator: AppCoordinator?
    
    var cat: Cats?
    
    func getCatImageURL(with id: String?) -> URL? {
        guard let id = id else {
            //log error
            print("id is nil")
            return URL(string: "")
        }

        return URL(string: "\(Constants.CatURL)\(id)")
    }
    
    func getDate(from stringDate: String?) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let dateFormatterSet = DateFormatter()
        dateFormatterSet.dateFormat = "MMM dd,yyyy"
        guard let stringDate = stringDate, let date: NSDate = dateFormatterGet.date(from: stringDate) as NSDate? else { return "" }
        
        return dateFormatterSet.string(from: date as Date)
    }
}
