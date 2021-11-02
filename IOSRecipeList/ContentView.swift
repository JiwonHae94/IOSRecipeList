//
//  ContentView.swift
//  IOSRecipeList
//
//  Created by Jiwon_Hae on 2021/11/03.
//

import SwiftUI

struct ContentView: View {
    var array = ["Element 1","Element 3","Element 2", "Element 4", "Element 5"]
    
    var body: some View {
        NavigationView{
            
            /**
             * array : data type
             * id : uniquely idenitifiable data
             */
            List(array, id: \.self) { arrayElement in
                NavigationLink(
                    destination: {
                        Text("Destination")
                    }, label: {
                        Text(arrayElement)
                    }
                )
            }.navigationTitle(Text("My List"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
