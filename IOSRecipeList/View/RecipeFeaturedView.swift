//
//  RecipeFeaturedView.swift
//  IOSRecipeList
//
//  Created by Jiwon_Hae on 2021/11/06.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var recipeModel:RecipeViewModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("Featured Recipes")
                .font(Font.custom("Avenir Heavy", size: 24))
                .fontWeight(.bold)
                .padding(.leading)
                .padding(.top, 40)
            
            GeometryReader{ geo in
                TabView(selection: $tabSelectionIndex) {
                    ForEach(0..<recipeModel.recipes.count, id: \.self){ pos in
                        
                        if recipeModel.recipes[pos].featured {
                            
                            // Recipe card button
                            Button(action:{
                                // show the recipe detail sheet
                                self.isDetailViewShowing = true
                            }, label: {
                                // Recipe Card
                                ZStack{
                                    
                                    Rectangle()
                                        .foregroundColor(.white)
                                    VStack(spacing: 0){
                                        Image(recipeModel.recipes[pos].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        
                                        Text(recipeModel.recipes[pos].name)
                                            .padding(5).font(Font.custom("Avenir", size: 15))
                                    }
                                }
                            })
                            .tag(pos)
                            .sheet(isPresented: $isDetailViewShowing){
                                // Show the Recipe Detail View
                                RecipeDetailView(recipe: recipeModel.recipes[pos])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                            
                                
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10){
                Text("Prepration time")
                    .font(Font.custom("Avenir Heavy", size: 16))
                Text(recipeModel.recipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("Avenir", size: 15))
                Text("Highlights")
                    .font(Font.custom("Avenir Heavy", size: 16))
                Text(recipeModel.recipes[tabSelectionIndex].highlights.joined(separator: ", "))
                    .font(Font.custom("Avenir", size: 15))
            }
            .padding([.leading, .bottom])
        }.onAppear(perform: {
            initFeatureIndex()
        })
    }
    
    func initFeatureIndex(){
        tabSelectionIndex = recipeModel.recipes.firstIndex{ (recipe) -> Bool in
            return recipe.featured
        } ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeViewModel())
    }
}
