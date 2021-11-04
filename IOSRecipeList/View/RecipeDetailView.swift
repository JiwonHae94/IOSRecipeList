//
//  RecipeDetailView.swift
//  IOSRecipeList
//
//  Created by Jiwon_Hae on 2021/11/05.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe : Recipe
    
    var body: some View {
        ScrollView{
            
            
            VStack(alignment: .leading){
                
                // MARK: RecipeImage
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                
                // MARK: Ingrdients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.top, .bottom], 5)
                    ForEach(recipe.ingredients, id: \.self){ i in
                        Text("· " + i)
                            .padding(.bottom, 2)
                            .font(.body)
                    }
                }.padding(.horizontal)
                
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .padding([.top, .bottom], 5)
                    ForEach(0..<recipe.directions.count, id: \.self){ index in
                        Text("\(index+1). \(recipe.directions[index])")
                            .padding(.bottom, 6)
                            .font(.body)
                    }
                    
                }.padding(.horizontal)
            }
        }.navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeViewModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
