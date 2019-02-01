//
//  AppDelegate.swift
//  IcontoStore
//
//  Created by John N Blanchard on 1/30/19.
//  Copyright © 2019 John Norman Blanchard. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  func application(_ sender: NSApplication, openFiles filenames: [String]) {
    guard let selectedFile = filenames.first else { return }
    let url = URL(fileURLWithPath: selectedFile)
    NSWorkspace.shared.openFile(url.deletingLastPathComponent().deletingLastPathComponent().path, withApplication: "Finder")
    NSWorkspace.shared.openFile(url.deletingLastPathComponent().path, withApplication: "Finder")
  }

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Insert code here to initialize your application
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }


}

