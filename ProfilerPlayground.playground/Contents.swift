import Foundation
import UIKit


func printNames(response: ChemicalResponse) -> Void {
    print(response.data![0].name)
    print()
    
    let altNames = response.data![0].altNames
    
    print("Trade Names:")
    print(altNames.trade?.joined(separator: ", ") ?? "")
    print()
    
    print("Generic Names:")
    print(altNames.generic?.joined(separator: ", ") ?? "")
    print()
}

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
            print()
            
            printNames(response: response)
            
        } catch {
            // Catch errors that occur while parsing
            print("Error while parsing JSON data from PharmGKB.")
        }
    }
    
}

                                
dataTask.resume()
