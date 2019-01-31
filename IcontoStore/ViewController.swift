//
//  ViewController.swift
//  IcontoStore
//
//  Created by John N Blanchard on 1/30/19.
//  Copyright © 2019 John Norman Blanchard. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
  
  @IBOutlet weak var imageWell: DroppableImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imageWell.delegate = self
    // Do any additional setup after loading the view.
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
    
    let resized157 = img.resizeWhileMaintainingAspectRatioToSize(size: NSSize(width: 157, height: 157))
    guard let desktopPath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as [String]).first else { return }
    let desktopURL = URL(fileURLWithPath: desktopPath, isDirectory: true).appendingPathExtension("157.png")
    try? resized157?.savePNGRepresentationToURL(url: desktopURL)
  }
}

