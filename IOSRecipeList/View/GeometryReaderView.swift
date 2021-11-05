//
//  GeometryReaderView.swift
//  IOSRecipeList
//
//  Created by Jiwon_Hae on 2021/11/06.
//

import SwiftUI

struct GeometryReaderView: View {
    var body: some View {
        
        GeometryReader { geo in
            Rectangle().foregroundColor(.green)
                .frame(width: geo.size.width, height: geo.size.height / 2, alignment: .center)
                
            Rectangle().foregroundColor(.red)
                .position(x: geo.size.width / 2, y: geo.size.height / 4)
                .frame(width: geo.size.width * 2 / 3, height: geo.size.height / 8, alignment: .center)
            
            Rectangle()
                .foregroundColor(.orange)
                .offset(x: geo.size.width / 2, y: geo.size.height / 2)
                .frame(width: geo.size.width / 2, height: geo.size.height / 2, alignment: .leading)
            
            Rectangle()
                .foregroundColor(.purple)
                .offset(x:0, y:geo.size.height / 2)
                .frame(width: geo.size.width / 2, height: geo.size.height / 2, alignment: .trailing)
            
            
        }.ignoresSafeArea()
        
        GeometryReader { geo in
            
            
        }
        
        
    }
}

struct GeometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderView()
    }
}
