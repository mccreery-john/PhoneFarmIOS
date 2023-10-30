//
//  MainView.swift
//  PhoneFarm
//
//  Created by John McCreery on 11/8/22.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var farmManager : FarmManager
    //@State private var selected = 0
    @State private var showingReset = false
    @State private var showingSettings = false
    var body: some View {
         
        
//        Image("farmBackground")
//            .resizable()
//            .frame(width: 300, height: 300)
        NavigationStack{
            TabView(selection: ($farmManager.pageSelected)){
                ForEach(0..<farmManager.pageNum, id: \.self){ i in
                    LandPageView(pageIndex: i)
                        .background(
                            Image("farmBackground").resizable()
                        ).clipped()
                }
            }.tabViewStyle(.page)
                .onChange(of: farmManager.pageSelected) {newSelection in
                    farmManager.pageSelected = newSelection
                }
                .onAppear() {
                    farmManager.pageSelected = 0
                }
                .toolbar{
                    //Reset button
                    ToolbarItem(placement: .navigationBarLeading){
                        Button(action: {showingReset.toggle()}){
                            
                            Text("Reset")
                                .padding()
                            //.foregroundColor(.white)
                        }//.background(.gray)
                    }
                    //Preferences/Settings Button
                    ToolbarItem(placement: .navigationBarLeading){
                        Button(action: {showingSettings.toggle()}){
                            Text("Settings")
                                .padding()
                            //.foregroundColor(.white)
                        }//.background(.gray)
                    }
                    
                    //Money Counter
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Text("$ \(farmManager.formatDouble(number: farmManager.currentMoney))")
                            .padding()
                        //.background(.red)
                    }
                }.padding()
            
        }
        .alert("Do you want to reset the game?", isPresented: $showingReset) {
            Button("Yes"){
                farmManager.reset()
            }
            Button("No", role: .cancel){}
        }
        .sheet(isPresented: $showingSettings) {
            SettingsView()
        }
        
            
        
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
