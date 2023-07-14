//
//  HomeView.swift
//  GPT VI
//
//  Created by Ethan McRae on 7/14/23.
//

import SwiftUI

struct HomeView: View {
    
    
    var body: some View {
        ZStack {
            HistoryView()
            NewChatView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
