//
//  RecipeDetailView.swift
//  IOSRecipeList
//
//  Created by Jiwon_Hae on 2021/11/05.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe : Recipe
    @State var servings = 2
    
    var body: some View {
        ScrollView{
             
            VStack(alignment: .leading){
                
                // MARK: RecipeImage
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: RecipeServing
                VStack(alignment: .leading) {
                    Text("Choose your serving size")
                        .font(.headline)
                        .padding([.top, .bottom], 5)

                    HStack{
                        ForEach(1...4, id : \.self){ pos in
                            Text(String(pos))
                        }
                    }
                }.padding(.horizontal)
                
                // MARK: Ingrdients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.top, .bottom], 5)
                    
                    ForEach(recipe.ingredients, id: \.self){ i in
                        Text("· " + String(i.name))
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
