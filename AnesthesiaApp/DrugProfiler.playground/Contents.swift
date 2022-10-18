import UIKit

// Create URL
let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")
guard let requestUrl = url else { fatalError() }

// Create URL Request
var request = URLRequest(url: requestUrl)

// Specify HTTP Method to use
request.httpMethod = "GET"

// Send HTTP Request
let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
    
    // Check if Error took place
    if let error = error {
        print("Error took place \(error)")
        return
    }
    
    // Read HTTP Response Status code
    if let response = response as? HTTPURLResponse {
        print("Response HTTP Status code: \(response.statusCode)")
    }
    
    // Convert HTTP Response Data to a simple String
    if let data = data, let dataRaw = String(data: data, encoding: .utf8) {
        print(dataRaw)
    }
    
    do {
            if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
              
            // Print out entire dictionary
            print(convertedJsonIntoDict)

            // Get value by key
            let userId = convertedJsonIntoDict["userId"]
            print(userId ?? "userId could not be read")
        }
    } catch let error as NSError {
               print(error.localizedDescription)
    }
    
}
task.resume()
