//
//  Conversation.swift
//  GPT VI
//
//  Created by Ethan McRae on 7/14/23.
//

import Foundation

struct Conversation: Identifiable {
    let id = UUID()
    let title: String
    var messages: [Message]
}
