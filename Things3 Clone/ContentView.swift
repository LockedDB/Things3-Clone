//
//  ContentView.swift
//  Things3 Clone
//
//  Created by Dani Benet on 13/1/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        HStack {
            Text("Hello world!")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Task.self, inMemory: true)
}
