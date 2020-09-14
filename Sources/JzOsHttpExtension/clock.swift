//
//  File 2.swift
//  
//
//  Created by Jianzhi.wang on 2020/9/14.
//

import Foundation
open class jzclock{
    var pastTime = Date().timeIntervalSince1970
    
    open func GetTime(_ timeStamp: Double)-> Double{
        let currentTime = Date().timeIntervalSince1970
        let reduceTime : TimeInterval = currentTime - timeStamp
        return reduceTime
    }
    
    open  func zeroing()->jzclock{
        pastTime = Date().timeIntervalSince1970
        return self
    }
    
    open func stop()->Double{
        return GetTime(pastTime)
    }
}
