//
//  File.swift
//  IOSRecipeList
//
//  Created by Jiwon_Hae on 2021/11/06.
//

import Foundation

struct Ingredient : Decodable, Identifiable, Hashable {
    var id : UUID?
    var name : String
    var num : Int?
    var unit : String?
    var demon : Int?
}
