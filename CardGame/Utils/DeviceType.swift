//
//  DeviceType.swift
//  CardGame
//
//  Created by Couto on 10/25/17.
//  Copyright © 2017 coutocode. All rights reserved.
//

#if os(iOS)
    
    import UIKit
    
    struct ScreenSize {
        static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    
    struct DeviceType {
        static let IS_IPHONE_4_OR_LESS = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
        static let IS_IPHONE_5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
        static let IS_TV = UIDevice.current.userInterfaceIdiom == .tv && ScreenSize.SCREEN_MAX_LENGTH == 1920.0
    }
    
#endif

enum BaseGameLayoutDevice: Int {
    case iPhone4OrLess
    case iPhone5
    case iPhone6
    case iPhone6p
    case iPad
}

class BaseGameLayout: NSObject {
    
    class func setup(layout: BaseGameLayoutDevice) {
        switch layout {
        case .iPhone4OrLess:
            self.setupIphone4OrLess()
            break
        case .iPhone5:
            self.setupIphone5()
            break
        case .iPhone6:
            self.setupIphone6()
            break
        case .iPhone6p:
            self.setupIphone6p()
            break
        case .iPad:
            self.setupIpad()
            break
        }
    }
    
    class func setupIphone6() {
        print("GameLayout - iPhone 6")
    }
    class func setupIphone6p() {
        print("GameLayout - iPhone 6+")
    }
    class func setupIphone5() {
        print("GameLayout - iPhone 5")
    }
    class func setupIphone4OrLess() {
        print("GameLayout - <= iPhone 4")
    }
    class func setupIpad() {
        print("GameLayout - iPad")
    }
    
}
