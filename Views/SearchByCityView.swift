//
//  SearchByCityView.swift
//  DemoWeatherApp
//
//  Created by Ankush Ladhane on 10/06/23
//

import SwiftUI

struct SearchByCityView: View {
    @State var searchKey = "London"
    @ObservedObject var viewModel: WeatherByCityViewModel
    
    var body: some View {
        VStack (alignment: .leading) {
            VStack(alignment: .center) {
                HStack(alignment: .center){
                    VStack (spacing: 15){
                        Text(" Temperature")
                        let tempIncelcious = Int(viewModel.mainTemp.temp - 273.15)
                        Text("\(tempIncelcious) °C")
                    }
                }
            }
            
            HStack(alignment: .center){
                VStack (spacing: 15){
                    Image(systemName: "sunrise")
                    let sunrise = unixToDate(ts: viewModel.sunRiseNSet.sunrise)
                    Text("\(sunrise)")
                    
                }.padding(20)
                
                VStack (spacing: 15){
                    Image(systemName: "sunset")
                    let sunset = unixToDate(ts: viewModel.sunRiseNSet.sunset)
                    Text("\(sunset)")
                }.padding(20)
                
                VStack (spacing: 15){
                    Image(systemName: "thermometer.sun")
                    let strMin = calculateFahrenheit(celsius: viewModel.mainTemp.tempMin)
                    Text("Min: \(strMin) °C")
                }.padding(20)
                
                VStack (spacing: 15){
                    Image(systemName: "thermometer.sun")
                    let strMax = calculateFahrenheit(celsius: viewModel.mainTemp.tempMax)
                    Text("Max: \(strMax) °C")
                }.padding(20)
            }
            
            
            List(viewModel.arrWeather, id: \.id) { weather in
                HStack {
                    Image(systemName: "cloud")
                    Text("\(weather.main) - ")
                    Text("\(weather.description)")
                }
            }
            .searchable(text: $searchKey)
            
        }
        .navigationTitle("Home")
        .onAppear(perform: runSearch)
        .onSubmit(of: .search, runSearch)
    }
 

    private func runSearch() {
        viewModel.input = .searchByCity(searchKey)
    }
    
    private func calculateCelsius(fahrenheit: Double) -> Double {
        var celsius: Double
        celsius = (fahrenheit - 32) * 5 / 9
        return celsius
    }
    
    private func unixToDate(ts: Int) -> String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(ts))
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "hh:mm a"
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
    
    private func calculateFahrenheit(celsius: Double) -> Double {
        var fahrenheit: Double
        fahrenheit = celsius * 9 / 5 + 32
        return fahrenheit
    }
}

struct SearchByCityView_Previews: PreviewProvider {
    static var previews: some View {
        SearchByCityView(viewModel: WeatherByCityViewModel())
    }
}
