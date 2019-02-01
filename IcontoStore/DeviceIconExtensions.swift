//
//  DeviceIconExtensions.swift
//  IcontoStore
//
//  Created by John N Blanchard on 1/31/19.
//  Copyright © 2019 John Norman Blanchard. All rights reserved.
//

import Foundation

extension ViewController {
  func makeDeviceFolder(at directoryURL: URL) {
    do {
      try contentFor(iconName: "icon").write(to: directoryURL.appendingPathComponent("Contents.json"), atomically: true, encoding: .utf8)
      try self.currentImage?.resize(withSize: NSSize(width: 1024, height: 1024))?.savePNGRepresentationToURL(url: directoryURL.appendingPathComponent("icon.png"))
      try self.currentImage?.resize(withSize: NSSize(width: 20, height: 20))?.savePNGRepresentationToURL(url: directoryURL.appendingPathComponent("icon20.png"))
      try self.currentImage?.resize(withSize: NSSize(width: 29, height: 29))?.savePNGRepresentationToURL(url: directoryURL.appendingPathComponent("icon29.png"))
      try self.currentImage?.resize(withSize: NSSize(width: 40, height: 40))?.savePNGRepresentationToURL(url: directoryURL.appendingPathComponent("icon40.png"))
      try self.currentImage?.resize(withSize: NSSize(width: 58, height: 58))?.savePNGRepresentationToURL(url: directoryURL.appendingPathComponent("icon58.png"))
      try self.currentImage?.resize(withSize: NSSize(width: 60, height: 60))?.savePNGRepresentationToURL(url: directoryURL.appendingPathComponent("icon60.png"))
      try self.currentImage?.resize(withSize: NSSize(width: 76, height: 76))?.savePNGRepresentationToURL(url: directoryURL.appendingPathComponent("icon76.png"))
      try self.currentImage?.resize(withSize: NSSize(width: 80, height: 80))?.savePNGRepresentationToURL(url: directoryURL.appendingPathComponent("icon80.png"))
      try self.currentImage?.resize(withSize: NSSize(width: 87, height: 87))?.savePNGRepresentationToURL(url: directoryURL.appendingPathComponent("icon87.png"))
      try self.currentImage?.resize(withSize: NSSize(width: 120, height: 120))?.savePNGRepresentationToURL(url: directoryURL.appendingPathComponent("icon120.png"))
      try self.currentImage?.resize(withSize: NSSize(width: 152, height: 152))?.savePNGRepresentationToURL(url: directoryURL.appendingPathComponent("icon152.png"))
      try self.currentImage?.resize(withSize: NSSize(width: 167, height: 167))?.savePNGRepresentationToURL(url: directoryURL.appendingPathComponent("icon167.png"))
      try self.currentImage?.resize(withSize: NSSize(width: 180, height: 180))?.savePNGRepresentationToURL(url: directoryURL.appendingPathComponent("icon180.png"))
    } catch {
      debugPrint(error)
    }
  }
  
  func makeMacFolder(at directoryURL: URL) {
    do {
      try contentForMacApp().write(to: directoryURL.appendingPathComponent("Contents.json"), atomically: true, encoding: .utf8)
      try self.currentImage?.resize(withSize: NSSize(width: 16, height: 16))?.savePNGRepresentationToURL(url: directoryURL.appendingPathComponent("icon16.png"))
      try self.currentImage?.resize(withSize: NSSize(width: 32, height: 32))?.savePNGRepresentationToURL(url: directoryURL.appendingPathComponent("icon32.png"))
      try self.currentImage?.resize(withSize: NSSize(width: 64, height: 64))?.savePNGRepresentationToURL(url: directoryURL.appendingPathComponent("icon64.png"))
      try self.currentImage?.resize(withSize: NSSize(width: 128, height: 128))?.savePNGRepresentationToURL(url: directoryURL.appendingPathComponent("icon128.png"))
      try self.currentImage?.resize(withSize: NSSize(width: 256, height: 256))?.savePNGRepresentationToURL(url: directoryURL.appendingPathComponent("icon256.png"))
      try self.currentImage?.resize(withSize: NSSize(width: 512, height: 512))?.savePNGRepresentationToURL(url: directoryURL.appendingPathComponent("icon512.png"))
      try self.currentImage?.resize(withSize: NSSize(width: 1024, height: 1024))?.savePNGRepresentationToURL(url: directoryURL.appendingPathComponent("icon1024.png"))
    } catch {
      debugPrint(error)
    }
  }
}
