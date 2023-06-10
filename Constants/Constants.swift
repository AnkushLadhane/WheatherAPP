//
//  Constants.swift
//  DemoWeatherApp
//
//  Created by Ankush Ladhane on 10/06/23
//

import Foundation
struct Constant {
    static let API1 = "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=5ba64c264504bfb334a128e3ddaa476b"
    
    static let APIByCity = "https://api.openweathermap.org/data/2.5/weather?q="
    //    static let APIByCity = "https://api.openweathermap.org/data/2.5/weather?q=london&appid=5ba64c264504bfb334a128e3ddaa476b"

    static let APICityCode = "https://api.openweathermap.org/data/2.5/weather?q=london,uk&appid=5ba64c264504bfb334a128e3ddaa476b"
    
    static let APIZipCode = "https://api.openweathermap.org/data/2.5/weather?zip=94040,us&appid=5ba64c264504bfb334a128e3ddaa476b"
    
    static let appidKey = "5ba64c264504bfb334a128e3ddaa476b"
}
