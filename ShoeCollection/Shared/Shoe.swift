//
//  Shoe.swift
//  ShoeCollection
//
//  Created by Jaewon Park on 10/28/21.
//

import Foundation
import SwiftUI

struct Shoe : Codable, Identifiable
{
    var id: String
    var name: String
    var description: String
    var ownShoe: Bool
    var imageName: String
}
