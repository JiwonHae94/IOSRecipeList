//
//  ContentView.swift
//  IOSRecipeList
//
//  Created by Jiwon_Hae on 2021/11/03.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var recipeModel = RecipeViewModel()
    
    var body: some View {
        List(recipeModel.recipes){ r in
            
            HStack(spacing: 20.0){
                Image(r.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipped()
                    .cornerRadius(5)
                Text(r.name)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
