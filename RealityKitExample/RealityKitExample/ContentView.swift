//
//  ContentView.swift
//  RealityKitExample
//
//  Created by Alan Tucker on 12/22/22.
//

import SwiftUI
import RealityKit
import ARKit


struct ContentView : View {
    
    @EnvironmentObject var gameSettings : Data
    
    var body: some View {
        return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        context.coordinator.view = arView
        
        let coinAnchor = try! Experience.loadCoin()
        
        context.coordinator.myScene = coinAnchor
        
        coinAnchor.actions.collectCoins.onAction = handleTapOnEntity(_:)
        arView.scene.anchors.append(coinAnchor)

        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func handleTapOnEntity(_ entity: Entity?) {
           guard let entity = entity else { return }
           // Do something with entity...
        
        entity.isEnabled = false
       }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    

    
        
}
class Coordinator: NSObject
{
    weak var view: ARView?
    weak var myScene: Experience.Coin?
    
    override init() {
        super.init()
        
        StartTimer()
    }
    
    func StartTimer()
    {
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            print("Timer fired!")
            
            
            
        }
        
    }
    
}
