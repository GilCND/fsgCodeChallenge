//
//  EpisodeModel.swift
//  fsgCodeChallenge
//
//  Created by Felipe Gil on 2021-04-29.
//

import Foundation


//Protocol that allow us to convert data to a struct: CODABLE

struct EpisodeResponse: Decodable {
    let results: EpisodeModel
    let status: String
}

struct EpisodesData: Decodable {
    
    let episodes: [EpisodeModel]
    
    private enum CodingKeys: String, CodingKey {
    case episodes = "results"
        
    }
}

struct EpisodeModel: Decodable, Identifiable {
    public let id: Int
    public let name: String
    public let airDate: String
    public let episode: String
    public let characters: [String]
    public let url: String
    public let created: String
    
    private enum CodingKeys: String, CodingKey {
        case id, name, episode, characters, url, created
        case airDate = "air_date"
    }
}
