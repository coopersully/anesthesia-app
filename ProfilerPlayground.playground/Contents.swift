import Foundation
import UIKit

let query = "butorphanol"

// Build web request URL
let type = "chemical"
let urlString = "https://api.pharmgkb.org/v1/data/\(type)?name=\(query)&view=max"
let url = URL(string: urlString)

// Create web request task
let session = URLSession.shared
let dataTask = session.dataTask(with: url!) { (data, response, error) in
    
    // If there is no error and some data was returned
    if error == nil && data != nil {
                
        let decoder = JSONDecoder()
        do {
            // Parse retrieved data into 'response' struct
            let response = try decoder.decode(ChemicalResponse.self, from: data!)
            
            // Print retrieved & parsed data
            print("ID: ", response.data![0].id)
            print("NAME: ", response.data![0].name)
            
            let altNames = response.data![0].altNames
            print("ALT NAMES (GENERIC): ", altNames.generic!)
            print("ALT NAMES (GENERIC): ", altNames.trade!)
            
        } catch {
            // Catch errors that occur while parsing
            print("Error while parsing JSON data from PharmGKB.")
        }
    }
    
}

                                
dataTask.resume()
