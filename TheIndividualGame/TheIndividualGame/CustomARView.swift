//
//  CustomARView.swift
//  TheIndividualGame
//
//  Created by Alan Tucker on 3/2/23.
//

import Foundation
import RealityKit
import ARKit

class CustomARView: ARView
{
    
    var DefaultConfiguration:ARWorldTrackingConfiguration
    {
        let config = ARWorldTrackingConfiguration()
        
        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("Could not find reference image folder")
        }

        //config.detectionImages = referenceImages
        config.planeDetection = .horizontal
        config.sceneReconstruction = .meshWithClassification
        config.environmentTexturing = .automatic
        
        self.debugOptions.insert(.showSceneUnderstanding)

        return config
    }
    
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        Configure()
    }
    
    @MainActor required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func Configure()
    {
        
        if ARWorldTrackingConfiguration.isSupported {
                    // Run the view's session
                session.run(DefaultConfiguration)
                } else {
                    print("config not supported")
                }
        
        
        
    }
}
