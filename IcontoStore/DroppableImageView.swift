//
//  DroppableImageView.swift
//  IcontoStore
//
//  Created by John N Blanchard on 1/30/19.
//  Copyright © 2019 John Norman Blanchard. All rights reserved.
//

import Cocoa

class DroppableImageView: NSImageView {
  
  override func draw(_ dirtyRect: NSRect) {
    super.draw(dirtyRect)
    
  }
  
  override func draggingEnded(_ sender: NSDraggingInfo) {
    let pasteBoard = sender.draggingPasteboard
    let fileName = pasteBoard.string(forType: NSPasteboard.PasteboardType.png)
    guard let pasteboard = sender.draggingPasteboard.propertyList(forType: NSPasteboard.PasteboardType(rawValue: "NSFilenamesPboardType")) as? NSArray,
      let path = pasteboard[0] as? String
      else { return }
    // have the img path!
    print(path)
  }
  
}
