//
//  MilkingView.swift
//  PhoneFarm
//
//  Created by John McCreery on 11/17/22.
//

import SwiftUI

struct MilkingView: View {
    var pageIndex : Int
    var penIndex : Int
    var animal : Animal
    //@State private var minigame  : TreeHarvestGame = TreeHarvestGame.start
    @EnvironmentObject var farmManager : FarmManager
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//struct MilkingView_Previews: PreviewProvider {
//    static var previews: some View {
//        MilkingView()
//    }
//}