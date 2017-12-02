//
//  DrawView.swift
//  TouchTracker
//
//  Created by Shim Sooyeon on 2017. 12. 2..
//  Copyright © 2017년 Shim Sooyeon. All rights reserved.
//

import UIKit

class DrawView: UIView {
    var currentLines = [NSValue: Line]()
    var finishedLines = [Line]()
    
    @IBInspectable var finishedLineColor: UIColor = UIColor.black {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var currentLineColor: UIColor = UIColor.red {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var LineThickness: CGFloat = 10 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    func strokeLine(line: Line) {
        let path = UIBezierPath()
        path.lineWidth = LineThickness
        path.lineCapStyle = CGLineCap.round
        
        path.move(to: line.begin)
        path.addLine(to: line.end)
        path.stroke()
    }
    
    override func draw(_ rect: CGRect) {
        finishedLineColor.setStroke()
        for line in finishedLines {
            strokeLine(line: line)
        }
        
        currentLineColor.setStroke()
        for (_, line) in currentLines {
            strokeLine(line: line)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 이벤트의 순서를 확인하기 위해 로그문을 넣어보자
        print(_FUNCTION_)
        
        for touch in touches {
            let location = touch.location(in: self)
            
            let newLine = Line(begin: location, end: location)
            
            let key = NSValue(nonretainedObject: touch)
            currentLines[key] = newLine
        }
        
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 이벤트의 순서를 확인하기 위해 로그문을 넣어보자
        print(_FUNCTION_)
        
        for touch in touches {
            let key = NSValue(nonretainedObject: touch)
            currentLines[key]?.end = touch.location(in: self)
        }
        
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 이벤트의 순서를 확인하기 위해 로그문을 넣어보자
        print(_FUNCTION_)
        
        for touch in touches {
            let key = NSValue(nonretainedObject: touch)
            if var line = currentLines[key] {
                line.end = touch.location(in: self)
                
                finishedLines.append(line)
                currentLines.removeValue(forKey: key)
            }
        }
        
        setNeedsDisplay()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 이벤트의 순서를 확인하기 위해 로그문을 넣어보자
        print(_FUNCTION_)
        
        currentLines.removeAll()
        
        setNeedsDisplay()
    }
}
