//
//  ContentView.swift
//  IOSRecipeList
//
//  Created by Jiwon_Hae on 2021/11/03.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var recipeModel:RecipeViewModel
    
    var body: some View {
        NavigationView{
            
            VStack(alignment: .leading){
                Text("All Recipe")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading)
                    .padding(.top, 40)
                
                ScrollView{
                    
                    LazyVStack(alignment: .leading){
                        ForEach(recipeModel.recipes, id: \.self){ r in
                            NavigationLink(
                                destination: RecipeDetailView(recipe: r),
                                label: {
                                    
                                    HStack(spacing: 20.0){
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .clipped()
                                            .cornerRadius(5)
                                        Text(r.name)
                                    }
                                })

                        }
                    }
                    
                }
                .padding()
            }
            
            .navigationBarHidden(true)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeViewModel())
    }
}
