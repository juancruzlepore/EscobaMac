//
//  ViewController.swift
//  EscobaMac
//
//  Created by Juan Cruz Lepore on 9/2/19.
//  Copyright © 2019 Juan Cruz Lepore. All rights reserved.
//

import Cocoa
import SpriteKit
import GameplayKit

class ViewController: NSViewController, UpdateUIDelegate {
    
    @IBOutlet var skView: SKView!
    
    var gameManager: GameManager?
    
    @IBAction func startGame(_ sender: NSButton) {
        gameManager?.startGame()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let aiPlayer = Player(name: "AI")
        let humanPlayer = Player(name: "human")
        let aiTeam = Team([aiPlayer])
        let humanTeam = Team([humanPlayer])
        gameManager = GameManager(gameType: .escoba, gameTeams: [aiTeam, humanTeam])
        gameManager?.delegate = self
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        if let scene = GKScene(fileNamed: "GameScene") {
            
            // Get the SKScene from the loaded GKScene
            if let sceneNode = scene.rootNode as! GameScene? {
                
                // Copy gameplay related content over to the scene
                sceneNode.entities = scene.entities
                sceneNode.graphs = scene.graphs
                
                // Set the scale mode to scale to fit the window
                sceneNode.scaleMode = .aspectFill
                
                // Present the scene
                if let view = self.skView {
                    view.presentScene(sceneNode)
                    
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true
                }
            }
        }
        
        
    }
    
    func updateUI(_ hands: [[Card]], _ board: Board) {
        
    }
}

