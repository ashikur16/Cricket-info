//
//  API.swift
//  NewsApp
//
//  Created by bjit on 15/1/23.
//

import Foundation
import UIKit
import CoreData

class APICaller {
    
    static let shared = APICaller()
    
    private init() {}
    
//    func getDataFromApi(url: String, completion: @escaping (Welcome?) -> Void){
//
//        var result: Welcome?
//
//        let task = URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
//
//            print("\n\n\nURLSession.shared.dataTask Started getDataFromApi\n\n\n")
//
//            guard let data = data, error == nil else {
//                print("Error: ", error)
//                return
//            }
//            print(data)
//            do {
//                //decoder.dateDecodingStrategy = .iso8601
//                result = try JSONDecoder().decode(Welcome.self, from: data)
//            }
//            catch {
//                print(error.localizedDescription)
//                return
//            }
//
//            guard let json = result else {
//                print("Error :(")
//                return
//            }
//            completion(json)
//
//        }
//        task.resume()
//    }
    
    
    func getDataFromApi<T: Codable>(url: String, type: T.Type, completion: @escaping (T) -> Void){

        var result: T?

        let task = URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in

            print("\n\n\nURLSession.shared.dataTask Started getDataFromApi\n\n\n")

            guard let data = data, error == nil else {
                print("Error: ", error)
                return
            }
            print(data)
            do {
                //decoder.dateDecodingStrategy = .iso8601
                result = try JSONDecoder().decode(type, from: data)
            }
            catch {
                print(error.localizedDescription)
                return
            }

            guard let json = result else {
                print("Error :(")
                return
            }
            completion(json)

        }
        task.resume()
    }
    
    
    
}
