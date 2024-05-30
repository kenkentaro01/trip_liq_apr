//
//  Practice.swift
//  trip_liq
//
//  Created by 健太郎 on 2024/05/30.
//

import SwiftUI

struct Practice: View {
    @State private var progress = 0.5
    
    var body: some View {
        TabView {
            ReceivedView()
                .badge(2)
                .tabItem {
                    Label("Received", systemImage: "tray.and.arrow.down.fill")
                }
            SentView()
                .tabItem {
                    Label("Sent", systemImage: "tray.and.arrow.up.fill")
                }
            AccountView()
                .badge("!")
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
        }
    }
}
    #Preview {
        Practice()
    }
    
    struct ReceivedView: View {
        
        var body: some View {
            Text("Hello")
        }
    }

struct SentView: View {
    
    var body: some View {
        Text("こんにちは")
    }
}

struct AccountView: View {
    
    var body: some View {
        Text("Hello")
    }
}
