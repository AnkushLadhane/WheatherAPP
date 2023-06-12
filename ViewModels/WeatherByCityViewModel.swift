//
//  WeatherByCityViewModel.swift
//  DemoWeatherApp
//
//  Created by Ankush Ladhane on 10/06/23
//

import Foundation
import Combine

class WeatherByCityViewModel: ObservableObject {
    
    public enum Input {
        case searchByCity(String)
    }
    
    @Published public private (set) var arrWeather =  [Weather]()
    @Published public private (set) var mainTemp =  Main(temp: 0.0, feelsLike: 0.0, tempMin: 0.0, tempMax: 1.0, pressure: 1, humidity: 1)
    @Published public private (set) var sunRiseNSet = Sys(type: 1, id: 1, country: "", sunrise: 1, sunset: 1)
    @Published public var input: Input?
    private var cancallables = Set<AnyCancellable>()
    
    init() {
        $input.compactMap{$0}.sink { [unowned self] action in
            switch action {
            case .searchByCity(let searchKey):
                debugPrint("\(searchKey)")
                
                UserDefaults.standard.set(searchKey, forKey: "searchKey")
                
                SearchByCityNetwork.getWeatherByCity(byKey: searchKey) {[weak self] result in
                    switch(result) {
                    case .success(let weathers):
                        DispatchQueue.main.async {
                            self?.arrWeather = weathers.weather
                            self?.mainTemp = weathers.main
                            self?.sunRiseNSet = weathers.sys
                        }
                    case .failure(let error):
                        debugPrint("\(error.localizedDescription)")
                    }
                }
            }
        }.store(in: &cancallables)
        
    }
    deinit {
        cancallables.forEach{$0.cancel()}
    }
}
