//
//  LocationModel.swift
//  fsgCodeChallenge
//
//  Created by Felipe Gil on 2021-04-29.
//

import Foundation

//Protocol that allow us to convert data to a struct: CODABLE
struct LocationModelData: Decodable {
    
    let location: [LocationModel]
    
    private enum CodingKeys: String, CodingKey {
    case location = "results"
        
    }
}


struct LocationModel: Decodable, Identifiable {
    public let id: Int
    public let name: String
    public let type: String
    public let dimension: String
    public let residents: [String]
    public let url: String
    public let created: String

    private enum CodingKeys: String, CodingKey {
        case id, name, type, dimension, residents, url, created
    }
}
