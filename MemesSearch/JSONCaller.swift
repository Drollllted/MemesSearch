//
//  JSONCaller.swift
//  MemesSearch
//
//  Created by Drolllted on 05.06.2024.
//

import Foundation

struct JSONCaller: Codable{
    let success: Bool
    let data: DataMemes
}

struct DataMemes: Codable{
    let memes: [Memes]
}


struct Memes: Codable{
    let id: String
    let name: String
    let url: String
    let height: Int?
    let width: Int?
    let box_count: Int
}
