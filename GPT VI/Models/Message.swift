//
//  Message.swift
//  GPT VI
//
//  Created by Ethan McRae on 7/14/23.
//

import Foundation

enum Sender {
    case user
    case server
}

struct Message: Identifiable {
    let id = UUID()
    let content: String
    let sender: Sender
}
