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
        Conversation(id: 1, title: "Conversation 1"),
        Conversation(id: 2, title: "Conversation 2"),
        Conversation(id: 3, title: "Conversation 3"),
    ]
    
    var body: some View {
        VStack {
            Text("Past Conversations")
                .font(.title2)
            
            List(conversations) { conversation in
                NavigationLink(destination: ConversationView()) {
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
