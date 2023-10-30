//
//  FruitPiece.swift
//  PhoneFarm
//
//  Created by John McCreery on 12/10/22.
//

import SwiftUI

struct FruitPiece: View {
    var plantName: String
    @Binding var fruit : Fruit
    
    @State private var offset = CGSize.zero
    var body: some View {
        let move = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { value in
                fruit.moveBy(width: value.translation.width, height: value.translation.height)
                offset = CGSize.zero
            }
        
        Image(plantName.replacingOccurrences(of: " Tree", with: ""))
            .resizable()
            .frame(width: 50, height: 50)
            .position(x: fruit.position.x, y: fruit.position.y)
            .gesture(move)
            .offset(offset)
            
    }
}

//struct FruitPiece_Previews: PreviewProvider {
//    static var previews: some View {
//        FruitPiece()
//    }
//}
