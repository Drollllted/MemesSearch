//
//  APIRequest.swift
//  MemesSearch
//
//  Created by Drolllted on 08.06.2024.
//

import Foundation

class APIRequest{
    
    static let shared = APIRequest()
    
    private init(){}
    
    func getMemes() {
        let urlString = "https://api.imgflip.com/get_memes"
        
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let error = error else {
                print(error)
                return
            }
            
            guard let data = data else {return}
            do{
                let jsonDecoder = JSONDecoder()
                let json = try jsonDecoder.decode(JSONCaller.self, from: data)
                //print(json)
            } catch {
                print(error)
            }
            
            
            
        }
        task.resume()
    }
}
