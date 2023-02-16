//
//  HomeView.swift
//  RealityKitExample
//
//  Created by Alan Tucker on 1/3/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var augmentedRealityAvailable = false
    
    @StateObject var GameData = Data()
    
    var body: some View {
        
        VStack{
            NavigationStack
            {
                NavigationLink("Explore the dungeon", destination: EnableAR(enableAR: $augmentedRealityAvailable))
                    .padding()
                
                NavigationLink("Reep Rewards", destination:ContentView())
                    .disabled(!augmentedRealityAvailable)
                
                Image(systemName: "star")
                    .padding()
                
                if(GameData.image1)
                {
                    Text("Image 1 is unlocked")
                        .padding()
                }
                if(GameData.image2)
                {
                    Text("Image 2 is unlocked")
                        .padding()
                }
                
            }
            .environmentObject(GameData)

        }
       
    

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
