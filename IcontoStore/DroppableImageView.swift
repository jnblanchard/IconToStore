//
//  DroppableImageView.swift
//  IcontoStore
//
//  Created by John N Blanchard on 1/30/19.
//  Copyright © 2019 John Norman Blanchard. All rights reserved.
//

import Cocoa

protocol DragDelegate {
  func didCollect(path: String)
}

class DroppableImageView: NSImageView {
  
  var delegate: DragDelegate?
  
  override func draw(_ dirtyRect: NSRect) {
    super.draw(dirtyRect)
    
  }
  
  override func draggingEnded(_ sender: NSDraggingInfo) {
    let pasteBoard = sender.draggingPasteboard
    guard let pasteboard = pasteBoard.propertyList(forType: NSPasteboard.PasteboardType(rawValue: "NSFilenamesPboardType")) as? NSArray,
      let path = pasteboard[0] as? String
      else { return }
    delegate?.didCollect(path: path)
  }
  
}
