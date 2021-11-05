//
//  RecipeFeaturedView.swift
//  IOSRecipeList
//
//  Created by Jiwon_Hae on 2021/11/06.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var recipeModel:RecipeViewModel
    
    var body: some View {
        Text("FeaturedView")
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
    }
}
