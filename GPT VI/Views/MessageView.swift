//
//  MessageView.swift
//  GPT VI
//
//  Created by Ethan McRae on 7/14/23.
//

import SwiftUI

struct MessageView: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.sender == Sender.user {
                Spacer()
                Text(message.content)
                    .padding()
                    .background(Color(hue: 0.597, saturation: 0.178, brightness: 0.781))
                    .foregroundColor(.white)
                    .cornerRadius(10)
//                Spacer()
            } else {
//                Spacer()
                Text(message.content)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                Spacer()
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: Message(
            content: "Hello, World!",
            sender: .user
        ))
    }
}
