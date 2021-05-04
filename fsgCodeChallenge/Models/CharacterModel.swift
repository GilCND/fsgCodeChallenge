//
//  CharacterModel.swift
//  fsgCodeChallenge
//
//  Created by Felipe Gil on 2021-04-29.
//

import Foundation
import Combine

struct Response: Decodable {
    let results: CharacterModel
    let status: String
}


//In order to convert objects we need another 2 structs for Origin and Location
public struct OriginModel: Decodable {
    public let name: String
    public let url: String
}
struct PositionModel: Decodable {
    public let name: String
    public let url: String
}

struct CharacterModel: Decodable, Identifiable {
    let id: Int
    let name: String
    let status: String
    public let species: String
    public let type: String
    public let gender: String
    public let origin: OriginModel
    public let location: PositionModel
    public let image: String
    public let episode: [String]
    public let url: String
    public let created: String
    
    
    private enum CodingKeys: String, CodingKey {
        case id, name, status, species, type, gender, origin, location, image, episode, url, created
    }
    
}
