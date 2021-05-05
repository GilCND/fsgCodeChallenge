//
//  ApiService.swift
//  fsgCodeChallenge
//
//  Created by Felipe Gil on 2021-04-29.
//

import Foundation

class ApiService {
    
    private var dataTask: URLSessionDataTask?
    
    func getData<ModelType: Decodable>(Url: String, completion: @escaping (ModelType) -> ()) {
        guard let url = URL(string: Url) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Something went wrong")
                return
            }
            var result: ModelType?
            do {
                result = try JSONDecoder().decode(ModelType.self, from: data)
            }
            catch {
                print ("Failed to convert\(error.localizedDescription)")
            }
            guard let json = result else {
                return
            }
            DispatchQueue.main.async {
                completion(json)
            }
        }
        task.resume()
    }
}
