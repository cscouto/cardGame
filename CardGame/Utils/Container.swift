//
//  Container.swift
//  CardGame
//
//  Created by Couto on 11/8/17.
//  Copyright © 2017 coutocode. All rights reserved.
//

class Container<T: AnyObject> {
    
    weak var value: T?
    
    init (value: T) {
        self.value = value
    }
    
}
