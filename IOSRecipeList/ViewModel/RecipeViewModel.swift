//
//  RecipeViewModel.swift
//  IOSRecipeList
//
//  Created by Jiwon_Hae on 2021/11/05.
//

import Foundation

class RecipeViewModel : ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init(){
        var data : [Recipe] = DataService.getLocalData(path: Bundle.main.path(forResource: "recipes", ofType: "json"))
            
        
        for index in 0..<data.count {
            data[index].id = UUID()
            
            for i in 0..<data[index].ingredients.count{
                data[index].ingredients[i].id = UUID()
            }
            
            print(data[index])
            recipes.append(data[index])
        }
        
    
    }
    
}
