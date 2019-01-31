//
//  ContentExtensions.swift
//  IcontoStore
//
//  Created by John N Blanchard on 1/31/19.
//  Copyright © 2019 John Norman Blanchard. All rights reserved.
//

import Foundation
import Cocoa

extension ViewController {
  func createIconsAndFindLocation() {
    let dialog = NSOpenPanel()
    
    dialog.title                   = "Choose a location for your icons."
    dialog.showsResizeIndicator    = true
    dialog.showsHiddenFiles        = false
    dialog.canCreateDirectories    = true
    dialog.canChooseDirectories = true
    dialog.prompt = "Create Icons"
    //dialog.allowedFileTypes = ["png", "txt"]
    dialog.canChooseFiles = false
    
    dialog.level = NSWindow.Level(rawValue: Int(CGWindowLevelForKey(.modalPanelWindow)))
    
    
    dialog.begin { (response) in
      let result = dialog.url // Pathname of the file
      guard response == NSApplication.ModalResponse.OK else { return }
      self.path = result!.path
      guard let directoryURL = result?.appendingPathComponent("AppIcon.appiconset") else { return }
      self.bottomTextField.stringValue = "Icons at: \(directoryURL.path)"
      do {
        try FileManager.default.removeItem(at: directoryURL)
        try FileManager.default.createDirectory(atPath: directoryURL.path, withIntermediateDirectories: true, attributes: nil)
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
        print(error)
      }
    }
  }
}

func contentFor(iconName: String) -> String {
  
  return """
  {
  "images" : [
  {
  "size" : "20x20",
  "idiom" : "iphone",
  "filename" : "\(iconName)40.png",
  "scale" : "2x"
  },
  {
  "size" : "20x20",
  "idiom" : "iphone",
  "filename" : "\(iconName)60.png",
  "scale" : "3x"
  },
  {
  "size" : "29x29",
  "idiom" : "iphone",
  "filename" : "\(iconName)58.png",
  "scale" : "2x"
  },
  {
  "size" : "29x29",
  "idiom" : "iphone",
  "filename" : "\(iconName)87.png",
  "scale" : "3x"
  },
  {
  "size" : "40x40",
  "idiom" : "iphone",
  "filename" : "\(iconName)80.png",
  "scale" : "2x"
  },
  {
  "size" : "40x40",
  "idiom" : "iphone",
  "filename" : "\(iconName)120.png",
  "scale" : "3x"
  },
  {
  "size" : "60x60",
  "idiom" : "iphone",
  "filename" : "\(iconName)120.png",
  "scale" : "2x"
  },
  {
  "size" : "60x60",
  "idiom" : "iphone",
  "filename" : "\(iconName)180.png",
  "scale" : "3x"
  },
  {
  "size" : "20x20",
  "idiom" : "ipad",
  "filename" : "\(iconName)20.png",
  "scale" : "1x"
  },
  {
  "size" : "20x20",
  "idiom" : "ipad",
  "filename" : "\(iconName)40.png",
  "scale" : "2x"
  },
  {
  "size" : "29x29",
  "idiom" : "ipad",
  "filename" : "\(iconName)29.png",
  "scale" : "1x"
  },
  {
  "size" : "29x29",
  "idiom" : "ipad",
  "filename" : "\(iconName)58.png",
  "scale" : "2x"
  },
  {
  "size" : "40x40",
  "idiom" : "ipad",
  "filename" : "\(iconName)40.png",
  "scale" : "1x"
  },
  {
  "size" : "40x40",
  "idiom" : "ipad",
  "filename" : "\(iconName)80.png",
  "scale" : "2x"
  },
  {
  "size" : "76x76",
  "idiom" : "ipad",
  "filename" : "\(iconName)76.png",
  "scale" : "1x"
  },
  {
  "size" : "76x76",
  "idiom" : "ipad",
  "filename" : "\(iconName)152.png",
  "scale" : "2x"
  },
  {
  "size" : "83.5x83.5",
  "idiom" : "ipad",
  "filename" : "\(iconName)167.png",
  "scale" : "2x"
  },
  {
  "size" : "1024x1024",
  "idiom" : "ios-marketing",
  "filename" : "\(iconName).png",
  "scale" : "1x"
  }
  ],
  "info" : {
  "version" : 1,
  "author" : "xcode"
  }
  }
  """
  
  
}
