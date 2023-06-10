//
//  SearchByCityNetwork.swift
//  DemoWeatherApp
//
//  Created by Ankush Ladhane on 10/06/23
//

import Foundation

protocol SearchByCityNetworkProtocol {
    static func getWeatherByCity(byKey searchKey: String, Complition: @escaping(Result<WeatherByCity,Error>) -> Void)
}

class SearchByCityNetwork: SearchByCityNetworkProtocol {
    
    static func getWeatherByCity(byKey searchKey: String, Complition: @escaping (Result<WeatherByCity, Error>) -> Void) {
        let stringURL = Constant.APIByCity + searchKey + "&appid=\(Constant.appidKey)"
        debugPrint(stringURL)
        let sstringURLWithoutSpaces = stringURL.replacingOccurrences(of: " ", with: "")

        
        let urlReq = URL(string: sstringURLWithoutSpaces)!
        var mainRequest = URLRequest(url: urlReq)
        
        let defaultConfiguration = URLSessionConfiguration.default
        defaultConfiguration.waitsForConnectivity = true
        defaultConfiguration.timeoutIntervalForRequest = 300
        let sharedSession = URLSession(configuration: defaultConfiguration)
        mainRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        mainRequest.httpMethod = "POST"
        
        sharedSession.dataTask(with: mainRequest) { rData, response, error in
            
            guard let httpStatus = (response as? HTTPURLResponse)?.statusCode, (200...299).contains(httpStatus) else {
                Complition(.failure(error!))
                return
            }
            do {
                let result = try JSONDecoder().decode(WeatherByCity.self, from: rData!)
                Complition(.success(result))
            }  catch let error {
                Complition(.failure(error))
            }
        }.resume()
        
    }
    
}


