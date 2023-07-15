//
//  HistoryView.swift
//  GPT VI
//
//  Created by Ethan McRae on 7/14/23.
//

import SwiftUI

struct HistoryView: View {
    // Mock data
    let conversations = [
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
        ),
        Conversation(
            title: "Conversation 2",
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
    ]
    
    var body: some View {
        VStack {
            Text("Past Conversations")
                .font(.title2)
            
            List(conversations) { conversation in
                NavigationLink(destination: ConversationView(conversation: conversation)) {
                    Text(conversation.title)
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
