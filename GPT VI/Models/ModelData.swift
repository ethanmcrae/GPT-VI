//
//  ModelData.swift
//  GPT VI
//
//  Created by Ethan McRae on 7/14/23.
//

import Foundation
import Combine

final class ModelData {
//    @Published var landmarks: [Landmark] = load("landmarkData.json")
    
    var conversation: Conversation {
        Conversation(
            title: "Conversation 1",
            messages: [
                Message(
                    content: "Hello, GPT VI!",
                    sender: .user
                ),
                Message(
                    content: "Hi there! How can I assist you today?",
                    sender: .server
                )
            ]
        )
    }
    
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
