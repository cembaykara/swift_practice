//
//  ViewController.swift
//  artest
//
//  Created by Baris Cem Baykara on 10/20/17.
//  Copyright © 2017 Baris Cem Baykara. All rights reserved.
//

import ARKit
import SceneKit
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addModel: UIButton!
    @IBOutlet weak var showClouds: UISwitch!
    @IBOutlet var sceneView: ARSCNView!
    
    
    let imageScale = (#imageLiteral(resourceName: "TallinnHeight").size.height / #imageLiteral(resourceName: "TallinnHeight").size.width)
    lazy var imageX = (#imageLiteral(resourceName: "TallinnHeight").size.height * imageScale)
    lazy var imageY = (#imageLiteral(resourceName: "TallinnHeight").size.width * imageScale)

    let node = SCNNode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let configruation = ARWorldTrackingConfiguration();
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        sceneView.session.run(configruation)
        showClouds.isHidden = true
        sceneView.autoenablesDefaultLighting = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showClouds(_ sender: UISwitch) {
        let clouds = SCNNode()
        let emitterNode = SCNNode()
        let emitterNode2 = SCNNode()
        let boundingEnd = SCNNode()
        let physicsShape = SCNPhysicsShape(geometry: SCNPlane(width: imageY*50, height: imageX*50))
        let emitterShape = SCNPlane(width: imageX, height: 0.05)
        let boundingEndObject = SCNPlane(width: imageY, height: imageX)
        let particle = SCNParticleSystem(named: "SceneKit Particle System.scnp", inDirectory: nil)
        emitterShape.widthSegmentCount = 3
        emitterShape.widthSegmentCount = 3
        
        boundingEnd.geometry = boundingEndObject
        boundingEnd.geometry?.firstMaterial?.diffuse.contents = UIColor.clear
        boundingEnd.eulerAngles = SCNVector3(0,-1.5708,0)
        boundingEnd.position = SCNVector3((imageY/2),0,0)
        boundingEnd.physicsBody?.physicsShape = physicsShape
        
        particle?.emitterShape = emitterShape
        particle?.birthLocation = SCNParticleBirthLocation(rawValue: 1)! //vertex
        particle?.particleDiesOnCollision = true
        particle?.colliderNodes = [boundingEnd]

        emitterNode.addParticleSystem(particle!)
        emitterNode.position = SCNVector3(-imageY/2,0.4,-imageX/4)
 //       emitterNode.eulerAngles = SCNVector3(-1.5708,0,0)
        emitterNode.scale = SCNVector3(1,0.5,1)
        emitterNode2.addParticleSystem(particle!)
        emitterNode2.position = SCNVector3(-imageY/2,0.33,imageX/4)
 //       emitterNode2.eulerAngles = SCNVector3(-1.5708,0,0)
        emitterNode2.scale = SCNVector3(1,0.5,1)
        clouds.addChildNode(boundingEnd)
        clouds.addChildNode(emitterNode)
        clouds.addChildNode(emitterNode2)
        
        if (sender.isOn){
            node.addChildNode(clouds)
        }else{
            node.enumerateChildNodes({ (clouds, _) in
                clouds.removeFromParentNode()
            })
        }
    }
    
    
    @IBAction func addModel(_ sender: UIButton) {

        showClouds.isHidden = false
        addModel.isHidden = true
        print(imageY,imageX)
        let myPlane = SCNBox(width: imageY, height: 0.1, length: imageX, chamferRadius: 0)
        let tessallator = SCNGeometryTessellator()
        myPlane.tessellator = tessallator
        myPlane.tessellator?.smoothingMode = .phong
        myPlane.lengthSegmentCount = Int((imageX/imageScale) / 27)
        myPlane.widthSegmentCount = Int((imageY/imageScale) / 27)
        node.geometry = myPlane
        let surfaceMaterial = SCNMaterial()
        surfaceMaterial.displacement.contents = #imageLiteral(resourceName: "TallinnHeight")
        surfaceMaterial.diffuse.contents = #imageLiteral(resourceName: "TallinnText")
        surfaceMaterial.displacement.textureComponents = .red
        
        let groundMaterial = SCNMaterial()
        groundMaterial.diffuse.contents = #imageLiteral(resourceName: "Ground")
        print (imageX, imageY, imageScale)
        node.geometry?.materials = [groundMaterial,groundMaterial,groundMaterial,groundMaterial,surfaceMaterial,groundMaterial]
        node.position = SCNVector3(0,-0.1,-0.2)
        node.scale = SCNVector3(0.00025,0.025,0.00025)
        sceneView.scene.rootNode.addChildNode(node)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

