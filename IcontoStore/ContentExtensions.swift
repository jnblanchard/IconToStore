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
    dialog.canChooseFiles = false
    
    dialog.level = NSWindow.Level(rawValue: Int(CGWindowLevelForKey(.modalPanelWindow)))
    
    
    dialog.begin { (response) in
      let result = dialog.url // Pathname of the file
      guard response == NSApplication.ModalResponse.OK else { return }
      self.path = result!.path
      guard let directoryURL = result?.appendingPathComponent("AppIcon.appiconset") else { return }
      self.bottomTextField.stringValue = "Icons at: \(directoryURL.path)"
      do {
        if FileManager.default.fileExists(atPath: directoryURL.path) {
          try FileManager.default.removeItem(at: directoryURL)
        }
        try FileManager.default.createDirectory(atPath: directoryURL.path, withIntermediateDirectories: true, attributes: nil)
        //self.makeDeviceFolder(at: directoryURL)
        self.makeMacFolder(at: directoryURL)
      } catch {
        print(error)
      }
      NSWorkspace.shared.openFile(directoryURL.path, withApplication: "Finder")
      NSDocumentController.shared.noteNewRecentDocumentURL(directoryURL.appendingPathComponent("icon.png"))
    }
  }
}

func contentForMacApp() -> String {
  return """
  {
  "images" : [
  {
  "size" : "16x16",
  "idiom" : "mac",
  "filename" : "icon16.png",
  "scale" : "1x"
  },
  {
  "size" : "16x16",
  "idiom" : "mac",
  "filename" : "icon32.png",
  "scale" : "2x"
  },
  {
  "size" : "32x32",
  "idiom" : "mac",
  "filename" : "icon32.png",
  "scale" : "1x"
  },
  {
  "size" : "32x32",
  "idiom" : "mac",
  "filename" : "icon64.png",
  "scale" : "2x"
  },
  {
  "size" : "128x128",
  "idiom" : "mac",
  "filename" : "icon128.png",
  "scale" : "1x"
  },
  {
  "size" : "128x128",
  "idiom" : "mac",
  "filename" : "icon256.png",
  "scale" : "2x"
  },
  {
  "size" : "256x256",
  "idiom" : "mac",
  "filename" : "icon256.png",
  "scale" : "1x"
  },
  {
  "size" : "256x256",
  "idiom" : "mac",
  "filename" : "icon512.png",
  "scale" : "2x"
  },
  {
  "size" : "512x512",
  "idiom" : "mac",
  "filename" : "icon512.png",
  "scale" : "1x"
  },
  {
  "size" : "512x512",
  "idiom" : "mac",
  "filename" : "icon1024.png",
  "scale" : "2x"
  }
  ],
  "info" : {
  "version" : 1,
  "author" : "xcode"
  }
  }
  
  """
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
  "filename" : "\(iconName)1024.png",
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
