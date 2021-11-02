//
//  ContentView.swift
//  IOSRecipeList
//
//  Created by Jiwon_Hae on 2021/11/03.
//

import SwiftUI

struct ContentView: View {
    @State var array = [Int]()
    
    var body: some View {
        VStack{
            List(array, id:\.self){ arrayElement in
                Text("\(arrayElement)")
            }
            HStack{
                Button{
                    let randomInt = Int.random(in: 1...10)
                    
                    if !array.contains(7){
                        array.append(randomInt)
                    }
                    
                } label:{
                    Text("1st")
                }
                
                
                Button{
                    for idx in 0..<array.count{
                       array[idx] += 1
                    }
                } label:{
                    Text("2nd")
                }
            
            
                Button{
                    array.removeAll()
                } label:{
                    Text("3rd")
                }
            }
        }
        
    }
}

struct Lesson04 : View{
    @State var array = [Int]()
    
    var body : some View{
        HStack{
            Button{
                let randomInt = Int.random(in: 1...10)
                
                if !array.contains(7){
                    array.append(randomInt)
                }
                
            } label:{
                Text("1st")
            }
            
            
            Button{
                for idx in 0..<array.count{
                   array[idx] += 1
                }
            } label:{
                Text("2nd")
            }
        
        
            Button{
                array.removeAll()
            } label:{
                Text("3rd")
            }
        }
    }
}

struct Lesson03 : View{
    var array = ["Apple","Mango","Peach", "Banana", "Lemon"]
    @State var arrayDisplay:[String] = []
    
    var body : some View{
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
