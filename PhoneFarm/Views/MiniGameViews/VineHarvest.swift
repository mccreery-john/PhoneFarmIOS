//
//  VineHarvest.swift
//  PhoneFarm
//
//  Created by John McCreery on 11/17/22.
//

import SwiftUI

struct VineHarvest: View {
    var pageIndex : Int
    var plotIndex : Int
    var plant : Plant
    @EnvironmentObject var farmManager : FarmManager
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//struct VineHarvest_Previews: PreviewProvider {
//    static var previews: some View {
//        VineHarvest()
//    }
//}
