//
//  RecipeTabView.swift
//  IOSRecipeList
//
//  Created by Jiwon_Hae on 2021/11/06.
//

import SwiftUI

struct RecipeTabView: View {
    @State var tabIndex = 0
    
    var body: some View {
        TabView(selection : $tabIndex){
            Text("Featured View")
                .tabItem {
                    VStack{
                        Image(systemName: "star")
                        Text("Featured")
                    }
                }.tag(1)
            
            RecipeListView()
                .tabItem {
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }.tag(1)
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
