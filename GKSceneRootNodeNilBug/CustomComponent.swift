//
//  CustomComponent.swift
//  GKSceneRootNodeNilBug
//
//  Created by Shanaka Senevirathne on 5/10/19.
//  Copyright © 2019 Shanaka Senevirathne. All rights reserved.
//

import SpriteKit
import GameplayKit

class CustomComponent: GKComponent {
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didAddToEntity() {
        guard let gkSkNodeComponent = self.entity?.component(ofType: GKSKNodeComponent.self) else {
            print("Error. Cannot obtain a reference to GKSKNodeComponent")
            return
        }
        
        if let sprite = gkSkNodeComponent.node as? SKSpriteNode {
            sprite.texture?.filteringMode = .nearest
        }
    }
}
