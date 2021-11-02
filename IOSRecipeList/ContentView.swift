//
//  ContentView.swift
//  IOSRecipeList
//
//  Created by Jiwon_Hae on 2021/11/03.
//

import SwiftUI

struct ContentView: View {
    var array = ["Apple","Mango","Peach", "Banana", "Lemon"]
    @State var arrayDisplay:[String] = []
    
    var body: some View {
        NavigationView{
            
            VStack{
                /**
                 * array : data type
                 * id : uniquely idenitifiable data
                 */
                List(arrayDisplay, id: \.self) { arrayElement in
                    NavigationLink(
                        destination: {
                            Text("Destination")
                        }, label: {
                            Text(arrayElement)
                        }
                    )
                }.navigationTitle(Text("My List"))
                
                Button{
                    let randomIndex = Int.random(in: 0..<array.count)
                    arrayDisplay.append(array[randomIndex])
                } label:{
                    Text("Random generate")
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
