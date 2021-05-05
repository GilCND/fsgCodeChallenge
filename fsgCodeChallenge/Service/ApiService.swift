//
//  ApiService.swift
//  fsgCodeChallenge
//
//  Created by Felipe Gil on 2021-04-29.
//

import Foundation

class ApiService {
    
        private var dataTask: URLSessionDataTask?
    
    func getCharacters(completion: @escaping (CharacterModel) -> ())
    {
        let url = "https://rickandmortyapi.com/api/character/1"
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            
            guard let data = data, error == nil else {
                print("Something went wrong")
                return
            }
            //data
            
            var result: CharacterModel?
            do {
                result = try JSONDecoder().decode(CharacterModel.self, from: data)
            }
            catch {
                print ("Failed to convert\(error.localizedDescription)")
            }
            guard let json = result else {
                return
            }
            print (json)
            DispatchQueue.main.async {
                completion(json)
            }
        }
        
        task.resume()
    }
    
    
    func getEpisodes(completion: @escaping (EpisodeModel) -> ())
    {
        let url = "https://rickandmortyapi.com/api/episode/1"
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            
            guard let data = data, error == nil else {
                print("Something went wrong")
                return
            }
            //data
            
            var result: EpisodeModel?
            do {
                result = try JSONDecoder().decode(EpisodeModel.self, from: data)
            }
            catch {
                print ("Failed to convert\(error.localizedDescription)")
            }
            guard let json = result else {
                return
            }
            print (json)
            DispatchQueue.main.async {
                completion(json)
            }
           

        }
        
        task.resume()
    }
    
    func getLocation(completion: @escaping (LocationModel) -> ())
    {
        let url = "https://rickandmortyapi.com/api/location/1"
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            
            guard let data = data, error == nil else {
                print("Something went wrong")
                return
            }
            //data
            
            var result: LocationModel?
            do {
                result = try JSONDecoder().decode(LocationModel.self, from: data)
            }
            catch {
                print ("Failed to convert\(error.localizedDescription)")
            }
            guard let json = result else {
                return
            }
            print (json)
            DispatchQueue.main.async {
                completion(json)
            }
           

        }
        
        task.resume()
    }
}
