//
//  ConversationView.swift
//  GPT VI
//
//  Created by Ethan McRae on 7/14/23.
//

import SwiftUI

struct ConversationView: View {
    // Mock Data
    let messages = [
            Message(content: "Hello, GPT VI!", sender: .user),
            Message(content: "Hi there! How can I assist you today?", sender: .server)
        ]
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                // Each Message
                ForEach(messages) { message in
                    MessageView(message: message)
                }
                .padding(.horizontal, 8)
                
                Spacer()
                
                // Microphone button
                Button(action: {
                    print("Listening to user input...")
                }) {
                    Image(systemName: "mic.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                        .padding(10)
                        .background(Color(hue: 0.603, saturation: 0.027, brightness: 0.959))
                        .cornerRadius(45)
                }
                .padding(4)
                .background(.blue)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 4)
                
            }
        }
        .navigationTitle("Conversation")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
