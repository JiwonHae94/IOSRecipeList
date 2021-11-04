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
            
        print(data.count)
        
        for index in 0..<data.count {
            data[index].id = UUID()
            recipes.append(data[index])
        }
    
    }
    
}
