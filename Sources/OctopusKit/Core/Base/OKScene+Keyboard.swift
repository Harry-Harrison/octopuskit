//
//  OKScene+Keyboard.swift
//  OctopusKit
//
//  Created by ShinryakuTako@invadingoctopus.io on 2019/11/17.
//  Copyright © 2019 Invading Octopus. Licensed under Apache License v2.0 (see LICENSE.txt)
//

#if canImport(AppKit)

import AppKit

extension OKScene: KeyboardEventProvider {

    // TODO: Eliminate code duplication between OKScene+Keyboard and OKSubscene+Keyboard
    
    // MARK: - Player Input (macOS Keyboard)
    
    /// Relays keyboard-input events to the scene's `KeyboardEventComponent`.
    open override func keyDown(with event: NSEvent) {
        #if LOGINPUTEVENTS
        debugLog()
        #endif
        
        self.entity?[KeyboardEventComponent]?.keyDown = KeyboardEventComponent.KeyboardEvent(event: event, node: self)
    }
    
    /// Relays keyboard-input events to the scene's `KeyboardEventComponent`.
    open override func keyUp(with event: NSEvent) {
        #if LOGINPUTEVENTS
        debugLog()
        #endif
        
        self.entity?[KeyboardEventComponent]?.keyUp = KeyboardEventComponent.KeyboardEvent(event: event, node: self)
    }
    
    /// Relays keyboard-input events to the scene's `KeyboardEventComponent`.
    open override func flagsChanged(with event: NSEvent) {
        #if LOGINPUTEVENTS
        debugLog()
        #endif
        
        self.entity?[KeyboardEventComponent]?.flagsChanged = KeyboardEventComponent.KeyboardEvent(event: event, node: self)
    }

}

#endif
