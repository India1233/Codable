//
//  JsonModel.swift
//  Codable
//
//  Created by Suresh Shiga on 21/11/19.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

let json = """
[
{
"name" : "John",
"role": "Tech",
"years_of_exp": 9.0,
"place": "London"
} ,
{
"name" : "Roy",
"role": "Model",
"years_of_exp": 5.0,
"place": "New Yark"
},
{
"name" : "Jym",
"role": "Design",
"years_of_exp": 3.0,
"place" : "Mumbai"
},
{
"name" : "Kim",
"role": "Mobile dev",
"years_of_exp": 9.0,
"place": null
}
]
"""

enum Result<T> {
    case Success(T)
    case Error(String)
}

struct Employee: Decodable, CustomStringConvertible {
    let name: String
    let role: String
    let yearsOfExp: Double   // snake case to camel case
    let place: String?
    
    
    var description: String {
        return "Result===> name: \(name), Role: \(role), Exp:\(yearsOfExp), Place:\(place ?? "")"
    }
}


extension Employee {
    static func getData(completionHandler: (Result<[Employee]>) -> Void)  {
        guard let data = json.data(using: String.Encoding.utf8) else {
            return completionHandler(.Error("json Data Error"))
        }
        do {
            
            // without Snake Case
         //   let json = try JSONDecoder() .decode(Ship.self, from: data)
            
            // with Snake Case
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let json = try decoder.decode([Employee].self, from: data)
            completionHandler(.Success(json))
        } catch  {
            completionHandler(.Error("Getting error from Data: \(error)"))
        }
    }
}


