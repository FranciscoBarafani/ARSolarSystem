//
//  ViewController.swift
//  Planets
//
//  Created by Francisco  Barafani on 09/11/2019.
//  Copyright © 2019 Francisco  Barafani. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Sun
        let sun = planet(geometry: SCNSphere(radius: 0.35), diffuse: UIImage(named: "SunDiffuse")!, specular: nil, emission: nil, normal: nil, position: SCNVector3(0,1,-1))
        
        //Planet Parents to make them rotate at different speeds around the sun
        let earthParent = SCNNode()
        let venusParent = SCNNode()
        let mercuryParent = SCNNode()
        let marsParent = SCNNode()
        let jupiterParent = SCNNode()
        let saturnParent = SCNNode()
        let uranusParent = SCNNode()
        let neptuneParent = SCNNode()
        
        //Setting Sun as the RootNode
        earthParent.position = SCNVector3(0,1,-1)
        venusParent.position = SCNVector3(0,1,-1)
        mercuryParent.position = SCNVector3(0,1,-1)
        marsParent.position = SCNVector3(0,1,-1)
        jupiterParent.position = SCNVector3(0,1,-1)
        saturnParent.position = SCNVector3(0,1,-1)
        uranusParent.position = SCNVector3(0,1,-1)
        neptuneParent.position = SCNVector3(0,1,-1)

        self.sceneView.scene.rootNode.addChildNode(sun)
        self.sceneView.scene.rootNode.addChildNode(earthParent)
        self.sceneView.scene.rootNode.addChildNode(venusParent)
        self.sceneView.scene.rootNode.addChildNode(mercuryParent)
        self.sceneView.scene.rootNode.addChildNode(marsParent)
        self.sceneView.scene.rootNode.addChildNode(jupiterParent)
        self.sceneView.scene.rootNode.addChildNode(saturnParent)
        self.sceneView.scene.rootNode.addChildNode(uranusParent)
        self.sceneView.scene.rootNode.addChildNode(neptuneParent)

        //PLANETS
        //Earth
        let earth = planet(geometry: SCNSphere(radius: 0.2), diffuse: UIImage(named: "EarthDay"), specular: UIImage(named: "EarthSpecular"), emission: UIImage(named: "EarthEmission"), normal: UIImage(named: "EarthNormal"), position: SCNVector3(1.6,0,0) )
        //Venus
        let venus = planet(geometry: SCNSphere(radius: 0.2), diffuse: UIImage(named: "VenusSurface"), specular: nil, emission: UIImage(named: "VenusAtmosphere"), normal: nil, position: SCNVector3(1,0,0))
        //Mercury
        let mercury = planet(geometry: SCNSphere(radius: 0.09), diffuse: UIImage(named: "Mercury"), specular: nil, emission: nil, normal: nil, position: SCNVector3(0.6,0,0))
        //Moon
        let moon = planet(geometry: SCNSphere(radius: 0.05), diffuse: UIImage(named: "MoonSurface"), specular: nil, emission: nil, normal: nil, position: SCNVector3(0.2,0.2,0.3))
        //Mars
        let mars = planet(geometry: SCNSphere(radius: 0.17), diffuse: UIImage(named: "Mars"), specular: nil, emission: nil, normal: nil, position: SCNVector3(2,0,0))
        //Jupiter
        let jupiter = planet(geometry: SCNSphere(radius: 0.33), diffuse: UIImage(named: "Jupiter"), specular: nil, emission: nil, normal: nil, position: SCNVector3(2.3,0,0))
        //Saturn
        let saturn = planet(geometry: SCNSphere(radius: 0.27), diffuse: UIImage(named: "Saturn"), specular: nil, emission: nil, normal: nil, position: SCNVector3(2.8,0,0))
        //Uranus
        let uranus = planet(geometry: SCNSphere(radius: 0.21), diffuse: UIImage(named: "Uranus"), specular: nil, emission: nil, normal: nil, position: SCNVector3(3.1,0,0))
        //Neptune
        let neptune = planet(geometry: SCNSphere(radius: 0.18), diffuse: UIImage(named: "Neptune"), specular: nil, emission: nil, normal: nil, position: SCNVector3(3.4,0,0))
        
        //ROTATIONS ON PLACE
        //Rotating Planets
        sun.runAction(rotation(dur: 40))
        //Earth Rotation
        earth.runAction(rotation(dur: 24))
        //Venus Rotation
        venus.runAction(rotation(dur: 15))
        //Moon Rotation
        moon.runAction(rotation(dur: 10))
        //Mercury Rotation
        mercury.runAction(rotation(dur: 8))
        //Mars Rotation
        mars.runAction(rotation(dur: 16))
        //Jupiter Rotation
        jupiter.runAction(rotation(dur: 20))
        //Saturn Rotation
        saturn.runAction(rotation(dur: 17))
        //Uranus Rotation
        uranus.runAction(rotation(dur: 14))
        //Neptune Rotation
        neptune.runAction(rotation(dur: 10))

        //AROUND ROTATION
        earthParent.runAction(rotation(dur: 24))
        venusParent.runAction(rotation(dur: 14))
        mercuryParent.runAction(rotation(dur: 17))
        marsParent.runAction(rotation(dur: 20))
        jupiterParent.runAction(rotation(dur: 30))
        saturnParent.runAction(rotation(dur: 22))
        uranusParent.runAction(rotation(dur: 26))
        neptuneParent.runAction(rotation(dur: 16))

        
        //Adding planets
        earthParent.addChildNode(earth)
        venusParent.addChildNode(venus)
        mercuryParent.addChildNode(mercury)
        marsParent.addChildNode(mercury)
        jupiterParent.addChildNode(jupiter)
        saturnParent.addChildNode(saturn)
        uranusParent.addChildNode(uranus)
        neptuneParent.addChildNode(neptune)
        earth.addChildNode(moon)
        

    }
}

func planet(geometry: SCNGeometry, diffuse: UIImage?, specular: UIImage?, emission: UIImage?, normal: UIImage?, position: SCNVector3 ) -> SCNNode {
    let planet = SCNNode(geometry: geometry)
    planet.geometry?.firstMaterial?.diffuse.contents = diffuse
    planet.geometry?.firstMaterial?.specular.contents = specular
    planet.geometry?.firstMaterial?.emission.contents = emission
    planet.geometry?.firstMaterial?.normal.contents = normal
    planet.position = position
    return planet
       }
func rotation(dur: Double) -> SCNAction {
    let rotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreeToRadians), z: 0, duration: dur)
    let rotationForever = SCNAction.repeatForever(rotation)
    return rotationForever
}

extension Int {
    var degreeToRadians: Double { return Double(self) * .pi/180}
}
