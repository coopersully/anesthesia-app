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

func printNames(response: ConditionResponse) -> Void {
    print(response.data![0].name)
    print()
    
    let altNames = response.data![0].altNames
    
    print("Synonyms:")
    print(altNames.synonym?.joined(separator: ", ") ?? "")
    print()
}

func getChemical(query: String) -> ChemicalResponse? {
    
    let search = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "Invalid"
    print(search)
    
    // Build web request URL
    let type = "chemical"
    let urlString = "https://api.pharmgkb.org/v1/data/\(type)?name=\(search)&view=max"
    let url = URL(string: urlString)

    var chemicalResponse : ChemicalResponse? = nil
    
    // Create web request task
    let session = URLSession.shared
    let dataTask = session.dataTask(with: url!) { (data, response, error) in
        
        // If there is no error and some data was returned
        if error == nil && data != nil {
            
            let decoder = JSONDecoder()
            do {
                // Parse retrieved data into 'response' struct
                chemicalResponse = try decoder.decode(ChemicalResponse.self, from: data!)
                
                // Print retrieved & parsed data
                print("ID: ", chemicalResponse?.data![0].id ?? "Unknown")
                print()
                
                printNames(response: chemicalResponse!)
            } catch {
                // Catch errors that occur while parsing
                //print("Error while parsing JSON data from PharmGKB.")
            }
        }
    }
                                    
    dataTask.resume()
    return chemicalResponse
}

func getCondition(query: String) -> ConditionResponse? {
    
    let search = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "Invalid"
    print(search)
    
    // Build web request URL
    let type = "disease"
    let urlString = "https://api.pharmgkb.org/v1/data/\(type)?name=\(search)&view=max"
    let url = URL(string: urlString)

    var conditionResponse : ConditionResponse? = nil
    
    // Create web request task
    let session = URLSession.shared
    let dataTask = session.dataTask(with: url!) { (data, response, error) in
        
        // If there is no error and some data was returned
        if error == nil && data != nil {
            
            let decoder = JSONDecoder()
            do {
                // Parse retrieved data into 'response' struct
                conditionResponse = try decoder.decode(ConditionResponse.self, from: data!)
                
                // Print retrieved & parsed data
                print("ID: ", conditionResponse?.data![0].id ?? "Unknown")
                print()
                
                printNames(response: conditionResponse!)
            } catch {
                // Catch errors that occur while parsing
                //print("Error while parsing JSON data from PharmGKB.")
            }
        }
    }
                                    
    dataTask.resume()
    return conditionResponse
}

let question = "Malignant Hyperthermia"
getChemical(query: question)
getCondition(query: question)
