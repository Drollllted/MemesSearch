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
    
    func getMemes(completion: @escaping (String?) -> Void) {
        let urlString = "https://api.imgflip.com/get_memes"
        
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            guard let data = data else {return}
            do{
                let jsonDecoder = JSONDecoder()
                let json = try jsonDecoder.decode(JSONCaller.self, from: data)
               // print(json.data.memes)
                let urlImage = json.data.memes.randomElement()?.url
                print(json.data.memes.randomElement()?.url)
                completion(urlImage)
            } catch {
                print(error.localizedDescription)
            }
            
            
            
        }
        task.resume()
    }
}
