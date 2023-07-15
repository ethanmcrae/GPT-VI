//
//  NewChatView.swift
//  GPT VI
//
//  Created by Ethan McRae on 7/14/23.
//

import SwiftUI

struct StartConversationView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                Rectangle()
                    .frame(height: 137)
                    .foregroundColor(.blue)
                    .ignoresSafeArea(.all)
                    .offset(x: 0, y: 55.0)
                    .shadow(color: .black.opacity(0.4), radius: 5, x: 0, y: 0)
            }
            
            VStack {
                Spacer()
                
                NavigationLink(
                    destination: ConversationView(conversation: ModelData().conversation)
                ) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .padding(3)
                        .background(colorScheme == .dark ? .black : .white)
                        .foregroundColor(.blue)
                        .cornerRadius(40)
                        .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 2)
                }
                .padding(.bottom, 45)
            }
        }
    }
}

struct StartConversationView_Previews: PreviewProvider {
    static var previews: some View {
        StartConversationView()
    }
}
