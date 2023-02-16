//
//  Menu.swift
//  TheIndividualGame
//
//  Created by Alan Tucker on 2/16/23.
//

import SwiftUI

struct Menu: View {
    
    var body: some View {
        
        
            NavigationStack{
                NavigationLink(destination:ContentView())
                {
                    Text("Go To AR")
                    
                }
            }   
        
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
