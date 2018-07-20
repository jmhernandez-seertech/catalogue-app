//
//  GlobalVariables.swift
//  
//
//  Created by MacBook Pro on 11/07/2018.
//

class GlobalVariables {
    
    // These are the properties you can store in your singleton
    public var role: Int = 0 // 0 = Admin 1 = Guest
    
    // Here is how you would get to it without there being a global collision of variables.
    // , or in other words, it is a globally accessable parameter that is specific to the
    // class.
    class var sharedManager: GlobalVariables {
        struct Static {
            static let instance = GlobalVariables()
        }
        return Static.instance
    }
}

