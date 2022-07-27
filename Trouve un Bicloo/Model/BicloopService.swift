//
//  BicloopService.swift
//  Trouve un Bicloo
//
//  Created by kevin jan on 20/07/2022.
//

import Foundation



class BicloopService {
    
    private let _key = "?apiKey=253b116cdfdd41e37ad3e3240cc726317d67455b" 
    private let _baseUrl = "https://api.jcdecaux.com/"
    
    
    
    func getStations(completion: (([Station])-> Void)?) {
        let urlString = _baseUrl + "vls/v3/stations" + _key
        print(urlString)

        guard let url = URL(string: urlString) else { return }
        print(url)

        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print(error)
                return
            }
            
            if let stations = try? JSONDecoder().decode([Station].self, from: data) {
                
                for station in stations {
                    print(station.contractName)
                }

                completion?(stations)
                
            } else {
                print("Can't decode stations")
            }
            
        }
        task.resume()
    }
    
    

    
}
