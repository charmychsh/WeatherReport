//
//  ParseWeather.swift
//  WeatherReport
//
//  Created by Charmy Shah on 3/12/19.
//  Copyright © 2019 charmy. All rights reserved.
//

import Foundation
import CoreLocation

struct Weather {
    let summary:String
    let icon:String
    let minTemperature:Double
    let maxTemperature:Double
    
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    
    init(json:[String:Any]) throws {
        guard let summary = json["summary"] as? String else {throw SerializationError.missing("summary is missing")}
        
        guard let icon = json["icon"] as? String else {throw SerializationError.missing("icon is missing")}
        
        guard let maxTemperature = json["temperatureMax"] as? Double else {throw SerializationError.missing("temp is missing")}
        guard let minTemperature = json["temperatureMin"] as? Double else {throw SerializationError.missing("temp is missing")}
        
        self.summary = summary
        self.icon = icon
        self.minTemperature = minTemperature
        self.maxTemperature = maxTemperature
    }
    
    
    static let basePath = "https://api.darksky.net/forecast/72cf88963409814097986f4bc85ba854/"
    
    static func forecast (withLocation location:CLLocationCoordinate2D, completion: @escaping ([Weather]?) -> ()) {
        
        let url = basePath + "\(location.latitude),\(location.longitude)"
        let request = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
            
            var forecastArray:[Weather] = []
            
            if let data = data {
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        if let dailyForecasts = json["daily"] as? [String:Any] {
                            if let dailyData = dailyForecasts["data"] as? [[String:Any]] {
                                for dataPoint in dailyData {
                                    if let weatherObject = try? Weather(json: dataPoint) {
                                        forecastArray.append(weatherObject)
                                    }
                                }
                            }
                        }
                        
                    }
                }catch {
                    print(error.localizedDescription)
                }
                completion(forecastArray)
                
            }
            
            
        }
        
        task.resume()
    }
}
