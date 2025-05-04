package com.example.otusioshw12

import platform.Foundation.NSLog
import platform.UIKit.UIDevice

class IOSPlatform: Platform {
    override val name: String = UIDevice.currentDevice.systemName() + " " + UIDevice.currentDevice.systemVersion
}

actual fun getPlatform(): Platform = IOSPlatform()

actual fun debugLog(message: String) {
    NSLog(message)
}