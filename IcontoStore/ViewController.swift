//
//  ViewController.swift
//  IcontoStore
//
//  Created by John N Blanchard on 1/30/19.
//  Copyright © 2019 John Norman Blanchard. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
  @IBOutlet weak var topTextField: NSTextField!
  
  @IBOutlet weak var imageWell: DroppableImageView!
  
  var path = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as [String]).first
  var currentImage: NSImage? = nil
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imageWell.delegate = self
  }
  
  @IBAction func changeLocationTapped(_ sender: Any) {
    let dialog = NSOpenPanel()
    
    dialog.title                   = "Choose a location for your icon."
    dialog.showsResizeIndicator    = true
    dialog.showsHiddenFiles        = false
    dialog.canCreateDirectories    = true
    dialog.canChooseDirectories = true
    //dialog.allowedFileTypes = ["png", "txt"]
    dialog.canChooseFiles = false
    
    dialog.level = NSWindow.Level(rawValue: Int(CGWindowLevelForKey(.modalPanelWindow)))
    
  
    dialog.begin { (response) in
      let result = dialog.url // Pathname of the file
      guard response == NSApplication.ModalResponse.OK else { return }
      self.path = result!.path
      do {
        try self.currentImage?.savePNGRepresentationToURL(url: URL(fileURLWithPath: self.path!).appendingPathComponent("iconBig.png"))
      } catch {
        print(error)
      }
    }
  }
  
  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }


}

extension ViewController: DragDelegate {
  func didCollect(path: String) {
    guard let image = NSImageRep(contentsOfFile: path) else { return }
    
    let img = NSImage()
    img.addRepresentation(image)
    
    currentImage = img
    /*
    let resized157 = img.resizeWhileMaintainingAspectRatioToSize(size: NSSize(width: 157, height: 157))
    guard let currentPath = self.path else { return }
    let desktopURL = URL(fileURLWithPath: currentPath).appendingPathComponent("icon.png", isDirectory: true)
    guard (try? resized157?.savePNGRepresentationToURL(url: desktopURL)) != nil else { return }
    debugPrint("success saving")
    */
  }
}

