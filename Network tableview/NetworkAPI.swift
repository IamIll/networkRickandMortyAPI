//
//  File.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 28.06.2022.
//

import Foundation
import UIKit


class NetworkAPI {
    
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
    
    func downloadImage(url: String, completion: @escaping (_ image: UIImage)->()) {
        
        guard let url = URL(string: url) else { return }
        
        print(url)
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            print(url)
            
            if let data = data {
                do {
                    guard let image = try UIImage(data: data) else {return}
                    DispatchQueue.main.async {
                        completion(image)
                    }
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }
}
    
