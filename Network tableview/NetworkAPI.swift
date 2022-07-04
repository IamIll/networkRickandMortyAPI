//
//  File.swift
//  Network tableview
//
//  Created by Илья Дунайцев on 28.06.2022.
//

import Foundation


class NetworkAPI {
    
    func fetchData1(stringURL: String, completionHandler: @escaping (LocationModel?) -> Void) {
    
        guard let url = URL(string: stringURL ?? "nil") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let data = data else { return }
            
            do {
                let relust = try JSONDecoder().decode(LocationModel.self, from: data)
                completionHandler(relust)
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func fetchData(stringURL: String, completionHandler: @escaping (API?) -> Void)  {
    
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let data = data else { return }
            
            do {
                let relust = try JSONDecoder().decode(API.self, from: data)
                completionHandler(relust)
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func fetchData2(stringURL: String, completionHandler: @escaping (Character?) -> Void){
        
        guard let url = URL(string: stringURL ?? "nil") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let data = data else { return }
            
            do {
                let relust = try JSONDecoder().decode(Character.self, from: data)
                completionHandler(relust)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
