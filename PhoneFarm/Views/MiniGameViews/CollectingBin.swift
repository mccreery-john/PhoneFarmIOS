//
//  CollectingBin.swift
//  PhoneFarm
//
//  Created by John McCreery on 12/10/22.
//

import SwiftUI

struct CollectingBin: View {
    var binPosition : Position
    //var binType : plantType
    var body: some View {
        
        //FIXME: Might need to adjust sizes based on image sizes
        Image("treeBin")
            .resizable()
            .frame(width: 125, height: 125)
            .position(x: binPosition.x, y: binPosition.y)
    }
}

//struct CollectingBin_Previews: PreviewProvider {
//    static var previews: some View {
//        CollectingBin()
//    }
//}
