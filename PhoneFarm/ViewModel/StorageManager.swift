//
//  StorageManager.swift
//  CampusMap
//
//  Created by John McCreery on 9/17/22.
//
// taken from the inclass example, didn't see much reason to change it


import Foundation

class StorageManager<T:Codable> {
    let modelData : T?
    private var fileInfo : FileInfo
    private let fileName : String
    
    
    init(name:String) {
        
        fileName = name
        fileInfo = FileInfo(for: fileName)
        
        if fileInfo.exists {
            let decoder = JSONDecoder()
            do {
                let data = try Data.init(contentsOf: fileInfo.url)
                modelData = try decoder.decode(T.self, from: data)
            } catch {
                print(error)
                modelData = nil
            }
            return
        }
        
        
        // first time running app
        let mainBundle = Bundle.main
        let url = mainBundle.url(forResource: fileName, withExtension: "json")
        
        guard url != nil else {
            modelData = nil
            return
        }
        do {
            let data = try Data.init(contentsOf: url!)
            let decoder = JSONDecoder()
            modelData = try decoder.decode(T.self, from: data)
        } catch {
            print(error)
            modelData = nil
            
        }
    }
    
    func save(modelData:T) {

        let url = fileInfo.url
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(modelData)
            try data.write(to: url)
        } catch {
            print(error)
        }
    }
        
}
