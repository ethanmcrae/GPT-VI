//
//  NewChatView.swift
//  GPT VI
//
//  Created by Ethan McRae on 7/14/23.
//

import SwiftUI

struct NewChatView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                Rectangle()
                    .frame(height: 137)
                    .foregroundColor(Color(red: 0.295, green: 0.516, blue: 0.689))
                    .ignoresSafeArea(.all)
                    .offset(x: 0, y: 55.0)
                    .shadow(color: .black.opacity(0.4), radius: 5, x: 0, y: 0)
            }
            
            VStack {
                Spacer()
                
                NavigationLink(
                    destination: ConversationView()
                ) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .padding(3)
                        .background(.white)
                        .foregroundColor(Color(hue: 0.573, saturation: 0.576, brightness: 0.691))
                        .cornerRadius(40)
                        .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 2)
                }
                .padding(.bottom, 45)
            }
        }
    }
}

struct NewChatView_Previews: PreviewProvider {
    static var previews: some View {
        NewChatView()
    }
}
