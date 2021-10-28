//
//  ShoeStore.swift
//  ShoeCollection
//
//  Created by Jaewon Park on 10/28/21.
//

import Foundation

// •To get the data ready for use in the app, we need to add a data store structure
// •This structure will need to contain a published property which can be observed by the user interface to keep the List view up to date

import SwiftUI
import Combine

//Adding data store
class ShoeStore : ObservableObject
{
    @Published var shoes: [Shoe]
    
    init (shoes: [Shoe] = [])
    {
        self.shoes = shoes
    }
}
