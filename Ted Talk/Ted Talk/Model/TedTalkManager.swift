//
//  TedTalkManager.swift
//  Ted Talk
//
//  Created by Gonzalo Romero on 15/11/2021.
//

import Foundation

enum APIError: Error{
    case problem
}

class TedTalkManager{
    
func retrieve(onCompletition: @escaping (Result<[TedTalk],APIError>) -> Void){
    let url = Bundle.main.url(forResource: "tedTalks", withExtension: "json")
    guard let myurl = url,
          let myData = try? Data(contentsOf: myurl),
          let messages = try? JSONDecoder().decode([TedTalk].self, from: myData) else{
        onCompletition(.failure(.problem))
        return
    }
    onCompletition(.success(messages))
}
}
