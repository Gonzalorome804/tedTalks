//
//  TedTalk.swift
//  Ted Talk
//
//  Created by Gonzalo Romero on 15/11/2021.
//

import Foundation

struct TedTalk: Decodable{
    
    var comments: Int
    var description: String
    var duration: Int
    var event: String
    var film_date: Int
    var languages: Int
    var main_speaker: String
    var name: String
    var num_speaker: Int
    var published_date: Int
    var speaker_occupation: String
    var tags: [String]
    var title: String
    var url: String
    var views: Int
    
    func isFiltered(_ pickerSelectedRow: String, input: String) -> Bool{
        
        var result = false
        
        switch pickerSelectedRow {
        
        case "Event": do{
            print(input)
            if self.event.contains(input){
                result = true
            }
        }
        case "Main Speaker": do{
            if self.main_speaker.contains(input){
                result = true
            }
        }
        case "Title": do{
            if self.title.contains(input){
                result = true
            }
        }
        case "Name": do{
            if self.name.contains(input){
                result = true
            }
        }
        case "Description": do{
            if description.contains(input){
                result = true
            }
        }
        default:
            result = true
        }
        return result
    }
}
