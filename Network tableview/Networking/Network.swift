//
//  File.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 28.06.2022.
//

import Foundation
import UIKit


class Network {
    
    func fetchData2<T: Decodable>(stringURL: String, expacting: T.Type, completionHandler: @escaping (T) -> Void){
        
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            guard let data = data else { return }
            
            do {
                let relust = try JSONDecoder().decode(expacting.self, from: data)
                completionHandler(relust)
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func fetchImageData(from url: String?) -> Data? {
            guard let url = url else {return nil}
            guard let url = URL(string: url) else {return nil}
            let imageData = try? Data(contentsOf: url)
            return imageData
    }
}
    
