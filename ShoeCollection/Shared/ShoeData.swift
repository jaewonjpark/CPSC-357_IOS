//
//  ShoeData.swift
//  ShoeCollection
//
//  Created by Jaewon Park on 10/28/21.
//

import Foundation

// Going to need a way to load the shoeData.json file and translate the shoe entries into an array of Shoe objects
// Reading json file

import UIKit
import SwiftUI

//reading json file
var shoeData: [Shoe] = loadJson("shoeData.json")

//Decodable: json -> byte -> swift file
func loadJson<T: Decodable>(_ filename: String) -> T
{
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            
    else
    {
        fatalError("\(filename) not found.")
    }
    
    do
    {
        data = try Data(contentsOf: file)
    }
    catch
    {
        fatalError("Could not load \(filename): \(error)")
    }
    
    
    do
    {
        return try JSONDecoder().decode(T.self, from: data)
    }
    catch
    {
        fatalError("Unable to parse \(filename): \(error)")
    }
}
