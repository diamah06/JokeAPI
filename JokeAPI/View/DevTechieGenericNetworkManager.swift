//
//  ContentView.swift
//  JokeAPI
//
//  Created by Mahdia Amriou on 30/03/2023.
//

import SwiftUI
import NetworkService

struct DevTechieGenericNetworkManager: View {
    
    @State private var joke: ChuckNorrisJoke? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(joke?.value ?? "")
                    .font(.title3)
                Button("Show me the joke!") {
                    Task {
                        do {
                           let chuckNorrisJoke: ChuckNorrisJoke = try await NetworkManager().fetch(from: "https://api.chucknorris.io/jokes/random")
                           joke = chuckNorrisJoke
                        } catch {
                           print(error)
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                    }
            .padding()
            .navigationTitle("DevTechie")
        }
    }
}




struct DevTechieGenericNetworkManager_Previews: PreviewProvider {
    static var previews: some View {
        DevTechieGenericNetworkManager()
    }
}
