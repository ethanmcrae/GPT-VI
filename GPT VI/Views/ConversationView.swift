//
//  ConversationView.swift
//  GPT VI
//
//  Created by Ethan McRae on 7/14/23.
//

import SwiftUI

struct ConversationView: View {
    var conversation: Conversation
    @StateObject var speechService = SpeechService()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                // Each Message
                ForEach(conversation.messages) { message in
                    MessageView(message: message)
                }
                .padding(.horizontal, 8)
                
                // Transcribed Text
                if !speechService.transcribedText.isEmpty {
                    MessageView(message: Message(content: speechService.transcribedText, sender: .user))
                        .padding(.horizontal, 8)
                }
                
                Spacer()
                
                // Microphone button
                Button(action: {
                    if speechService.isRecording {
                        speechService.stopRecording()
                    } else {
                        speechService.startRecording()
                    }
                }) {
                    // Dynamically update voice UI based on recording status
                    let size: CGFloat = speechService.isRecording ? 30 : 40
                    let padding: CGFloat = speechService.isRecording ? 15 : 10
                    let icon: String = speechService.isRecording ? "stop.fill" : "mic.fill"
                    
                    Image(systemName: icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size, height: size)
                        .padding(padding)
                        .background(Color(hue: 0.603, saturation: 0.027, brightness: 0.959))
                        .cornerRadius(45)
                }
                .padding(4)
                .background(speechService.isSpeechRecognitionAvailable ? .blue : .gray)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 4)
                .offset(x: 0, y: -50)
                .disabled(!speechService.isSpeechRecognitionAvailable)
                
            }
        }
        .navigationTitle("Conversation")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView(conversation: ModelData().conversation)
    }
}
