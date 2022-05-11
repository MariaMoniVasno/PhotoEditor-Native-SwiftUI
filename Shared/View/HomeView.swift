//
//  ContentView.swift
//  Shared
//
//  Created by Trident on 11/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
        Text("Image Picker")
            .padding()
        }
        .navigationTitle("Photo Editor")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

