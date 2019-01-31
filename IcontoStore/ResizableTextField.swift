//
//  ResizableTextField.swift
//  IcontoStore
//
//  Created by John N Blanchard on 1/30/19.
//  Copyright © 2019 John Norman Blanchard. All rights reserved.
//

import Cocoa

class ResizableTextField: NSTextField {
  
  override func draw(_ dirtyRect: NSRect) {
    super.draw(dirtyRect)
  }
  
  override var intrinsicContentSize: NSSize {
    guard let cell = self.cell, cell.wraps else { return super.intrinsicContentSize }
    
    let width = super.intrinsicContentSize.width
    
    frame.size.height = 60
    
    let height = cell.cellSize(forBounds: frame).height
    
    return NSMakeSize(width, height);
  }
  
  override func textDidChange(_ notification: Notification) {
    super.textDidChange(notification)
    super.invalidateIntrinsicContentSize()
  }
  
}
