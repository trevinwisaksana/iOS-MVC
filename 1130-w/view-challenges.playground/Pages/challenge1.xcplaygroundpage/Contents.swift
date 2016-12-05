
import UIKit
import PlaygroundSupport

let canvasFrame = CGRect(x: 0, y :0, width: 200, height: 200)
let canvas = UIView(frame: canvasFrame)
canvas.backgroundColor = .white
PlaygroundPage.current.liveView = canvas // make the canvas appear in the assistant editor
/*:
 **Task**: Add a `UIView` to the `canvas` that is half as wide and half as high as the `canvas`. This new `UIView` should be _centered_ on the canvas:
 
 ![Challenge 1](./challenge1.png "Challenge 1")

 1. Implement above task by setting the view's `frame` directly.
 2. Implement above task by defining _AutoLayout_ constraints programmatically.
 
 (Make sure to comment out the first implementation once you start working on the second one to avoid confusion.)
 */
<<<<<<< HEAD
/* let margin = 50
let rect = CGRect(x: margin, y: margin, width: Int((canvas.frame.size.width) * 0.5), height: Int((canvas.frame.size.height) * 0.5))
let view = UIView(frame: rect)
view.backgroundColor = .red
canvas.addSubview(view) */

// configure blue
let redView = UIView(frame: CGRect.zero)
redView.translatesAutoresizingMaskIntoConstraints = false
redView.backgroundColor = .red
canvas.addSubview(redView)

let margin: CGFloat = 50
// Height
NSLayoutConstraint(item: redView, attribute: .height, relatedBy: .equal, toItem: canvas, attribute: .height, multiplier: 0.25, constant: margin).isActive = true
// Width
NSLayoutConstraint(item: redView, attribute: .width, relatedBy: .equal, toItem: canvas, attribute: .width, multiplier: 0.25, constant: margin).isActive = true
// Leading
NSLayoutConstraint(item: redView, attribute: .leading, relatedBy: .equal, toItem: canvas, attribute: .leading, multiplier: 0.5, constant: margin).isActive = true
// Top
NSLayoutConstraint(item: redView, attribute: .top, relatedBy: .equal, toItem: canvas, attribute: .top, multiplier: 0.5, constant: margin).isActive = true
// Bottom
NSLayoutConstraint(item: redView, attribute: .bottom, relatedBy: .equal, toItem: canvas, attribute: .bottom, multiplier: 0.5, constant: margin).isActive = true

PlaygroundPage.current.liveView = canvas // make the canvas appear in the assistant editor
=======
>>>>>>> 1804d074b370b0206976797c4e65f29f0a68c32e
