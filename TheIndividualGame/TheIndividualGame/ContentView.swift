//
//  ContentView.swift
//  TheIndividualGame
//
//  Created by Alan Tucker on 2/16/23.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        context.coordinator.view = arView
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        boxAnchor.actions.damageFloppy.onAction = context.coordinator.DamageFloppy(_:)
        context.coordinator.scene = boxAnchor
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
}
class Coordinator:NSObject
{
    weak var view:ARView?
    weak var scene: Experience.Box?
    
    var floppyHealth = 10
    
    
    override init() {
        super.init()
    }
    
    func DamageFloppy(_ entity: Entity?) {
            guard let entity = entity else { return }
            // Do something with entity...
        
            floppyHealth -= 1
        
          //Switch case could go here.
        
        
            if(floppyHealth <= 0)
            {
                scene?.notifications.floppyDies.post()
            }
        
        }
    
    
    
    /*
    func session(_: ARSession, didAdd: [ARAnchor])
    {
        
    }
     */
    
}

