//
//  Recipe.swift
//  IOSRecipeList
//
//  Created by Jiwon_Hae on 2021/11/05.
//

import Foundation

struct Recipe : Decodable, Identifiable {
    
    var id : UUID?
    var name, image, description, prepTime, cookTime, totalTime : String
    var featured : Bool
    var servings : Int
    var ingredients : [String]
    var directions : [String]
    
    init (
        name : String,
        image : String,
        description : String,
        prepTime : String,
        cookTime : String,
        totalTime : String,
        servings : Int,
        featured : Bool,
        ingredients : [String],
        directions : [String]
    ){
        self.name = name
        self.image = image
        self.description = description
        self.prepTime = prepTime
        self.cookTime = cookTime
        self.totalTime = totalTime
        self.ingredients = ingredients
        self.directions = directions
        self.featured = featured
        self.servings = servings
    }
    
}
