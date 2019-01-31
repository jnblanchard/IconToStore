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
  
  @IBOutlet weak var bottomTextField: NSTextField!
  @IBOutlet weak var imageWell: DroppableImageView!
  
  var path = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as [String]).first
  var currentImage: NSImage? = nil
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imageWell.delegate = self
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
    createIconsAndFindLocation()
    /*
    let resized157 = img.resizeWhileMaintainingAspectRatioToSize(size: NSSize(width: 157, height: 157))
    guard let currentPath = self.path else { return }
    let desktopURL = URL(fileURLWithPath: currentPath).appendingPathComponent("icon.png", isDirectory: true)
    guard (try? resized157?.savePNGRepresentationToURL(url: desktopURL)) != nil else { return }
    debugPrint("success saving")
    */
  }
}

