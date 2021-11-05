//
//  RecipeDetailView.swift
//  IOSRecipeList
//
//  Created by Jiwon_Hae on 2021/11/05.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe : Recipe
    
    @State var servingsSize = 2
    
    var body: some View {
        ScrollView{
             
            VStack(alignment: .leading){
                
                // MARK: RecipeImage
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe Title
                Text(recipe.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading)
                    .padding(.top, 20)
                
                // MARK: Serving Size Picker
                VStack (alignment: .leading) {
                    Text("Select your serving size:")
                    Picker("", selection: $servingsSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width:160)
                }
                .padding()
                
                // MARK: Ingrdients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.top, .bottom], 5)
                    
                    ForEach(recipe.ingredients, id: \.self){ i in
                        Text("· " + RecipeViewModel.getPortion(i, recipe.servings, servingsSize) + " " + String(i.name).lowercased())
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
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeViewModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
