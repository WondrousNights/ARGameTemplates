//
//  EnableAR.swift
//  RealityKitExample
//
//  Created by Alan Tucker on 1/3/23.
//

import SwiftUI

struct EnableAR: View {
    
    @Binding var enableAR: Bool;
    @EnvironmentObject var gameSettings : Data
    
    var body: some View {
        
        VStack{
          
            
            Text(String(gameSettings.health))
                .padding()
            
            Button("Fight Monster")
            {
                enableAR = true;
                gameSettings.health -= 2
                if(!gameSettings.image1)
                {
                   
                    gameSettings.image1 = true
                }
                else if(!gameSettings.image2)
                {
                   
                    gameSettings.image2 = true
                }
            }
            .padding()
            
            if(gameSettings.image1)
            {
                Text("Killed goblin, gained a treasure")
            }
            if(gameSettings.image2)
            {
                Text("Killed Boss, gained a treasure")
            }
        }
        
    }
}

