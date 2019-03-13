//
//  WeatherTableViewController.swift
//  WeatherReport
//
//  Created by Charmy Shah on 3/12/19.
//  Copyright © 2019 charmy. All rights reserved.
//

import UIKit
import CoreLocation


class CustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var maxTempTextView: UITextField!
    @IBOutlet weak var minTempTextView: UITextField!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
}


class WeatherTableViewController: UITableViewController, UISearchBarDelegate {

    var forecastData = [Weather]()
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchBar.accessibilityIdentifier = "search-bar" 
        
        
        updateWeatherForLocation(location: "New York")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let locationString = searchBar.text, !locationString.isEmpty {
            updateWeatherForLocation(location: locationString)
        }
    }
    
    func updateWeatherForLocation (location:String) {

        CLGeocoder().geocodeAddressString(location) { (placemarks:[CLPlacemark]?, error:Error?) in
            
            if error == nil {
                
                if let location = placemarks?.first?.location {
                    Weather.forecast(withLocation: location.coordinate, completion: { (results:[Weather]?) in
                        
                        if let weatherData = results {

                            self.forecastData = weatherData
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                            
                        }
                        
                    })
                }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return forecastData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        let weatherObject = forecastData[indexPath.section]
        
        /*cell.headlineTitleLabel?.text = headline.title*/
        cell.summaryLabel?.text = weatherObject.summary
        cell.minTempTextView?.text = "\(Int(weatherObject.minTemperature)) °F"
        cell.maxTempTextView?.text = "\(Int(weatherObject.maxTemperature)) °F"
        cell.iconImageView?.image = UIImage(named:weatherObject.icon)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let date = Calendar.current.date(byAdding: .day, value: section, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        
        return dateFormatter.string(from: date!)
    }

    
}
