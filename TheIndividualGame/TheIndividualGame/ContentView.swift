//
//  ContentView.swift
//  TheIndividualGame
//
//  Created by Alan Tucker on 2/16/23.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> CustomARView {
        
        let arView = CustomARView(frame: .zero)
        
        //let config = ARWorldTrackingConfiguration()
        //config.planeDetection = .horizontal
        //config.sceneReconstruction = .mesh
        //arView.environment.sceneUnderstanding.options.insert(.occlusion)
        
        //arView.session.run(config)
        
        context.coordinator.view = arView
        
        arView.environment.sceneUnderstanding.options = [.collision, .physics]
        arView.session.delegate = context.coordinator
        // Load the "Box" scene from the "Experience" Reality File
        if let boxAnchor = try? Experience.loadBox() {
            let box = boxAnchor.ball
            
            print(box!)
            
            let modelEntity:ModelEntity = box?.children[0] as! ModelEntity
        
            //modelEntity.physicsBody.gra
            arView.scene.anchors.append(boxAnchor)
            //context.coordinator.scene = boxAnchor

            let timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false)
            {
                _ in
                modelEntity.generateCollisionShapes(recursive: true)
                modelEntity.physicsBody = PhysicsBodyComponent(shapes: [.generateBox(size: .one)],
                                                      mass: 10,
                                                      material: .default,
                                                               mode: .dynamic)
            }
           
            
            
            // Do something with box.
        }
        
        
        //arView.environment.sceneUnderstanding.options.insert(.occlusion)
        
        
        //boxAnchor.actions.damageFloppy.onAction = context.coordinator.DamageFloppy(_:)
        
        
        // Add the box anchor to the scene
        print("appending box anchor")
        
        
        return arView
        
    }
    
    func updateUIView(_ uiView: CustomARView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
}

class Coordinator:NSObject, ARSessionDelegate
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
                //scene?.notifications.floppyDies.post()
            }
        
        }
    
    
    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        for anchor in anchors {
            
            if(anchor.name == "cat")
            {
                //let anchorEntity = AnchorEntity(world: anchor.transform)
                //anchorEntity.addChild(scene!)
                //view!.scene.anchors.append(anchorEntity)
                
            }
        }
    }
    
}

