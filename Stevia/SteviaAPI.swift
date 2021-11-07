//
//  SteviaAPI.swift
//  Stevia
//
//  Created by Gaston Seneza on 11/6/21.
//

import Foundation

final class SteviaAPI {
    static let shared = SteviaAPI()
    
    //let url = URL(string: "https://api.github.com/repos/freshOS/Stevia/issues")
    func fetchSteviaIssueList(completion: @escaping ([SteviaIssues]?, Error?) -> ()) {
        let urlString = "https://api.github.com/repos/freshOS/Stevia/issues"
        fetchAnyJSONData(urlString: urlString, completion: completion)
    }
    
    // Generic JSON decoder function
    func fetchAnyJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                //Failure
                completion(nil, error)
                return
            }
            do {
                guard let data = data else { return }
                let objects = try JSONDecoder().decode(T.self, from: data)
                //success
                completion(objects, nil)
                
            } catch {
                //failed to decode json
                completion(nil, error)
            }
        }.resume()
    }
    
    
}
