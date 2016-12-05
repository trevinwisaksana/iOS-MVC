import UIKit
import PlaygroundSupport

let canvasFrame = CGRect(x: 0, y :0, width: 300, height: 100)
let canvas = UIView(frame: canvasFrame)
canvas.backgroundColor = .white
PlaygroundPage.current.liveView = canvas // make the canvas appear in the assistant editor

let colors: [UIColor] = [.green, .blue, .red]

/*:
 **Task**: Add three `UIView`s to the `canvas`. Each of these views should be square and have the canvas's full `height` as well as a third of its `width`. Use the same colors as in the picture (they are already defined for you above in the `colors` array):

 ![Challenge 3](./challenge3.png "Challenge 3")
 
 1. Implement above task by setting the views' `frame`s directly.
 2. Implement above task by defining _AutoLayout_ constraints programmatically.
 
 (Make sure to comment out the first implementation once you start working on the second one to avoid confusion.)
 */

<<<<<<< HEAD
/* func creatingSquare(color: Int, positionX: Int, positionY: Int) {
    let sizeAndPosition = CGRect(x: positionX, y: positionY, width: Int((canvas.frame.size.width) * (1/3)), height: Int(canvas.frame.size.height))
    let square = UIView(frame: sizeAndPosition)
    square.backgroundColor = colors[color]
    canvas.addSubview(square)
}


// Green Square
creatingSquare(color: 0, positionX: 0, positionY: 0)
// Blue Square
creatingSquare(color: 1, positionX: 100, positionY: 0)
// Red Square
creatingSquare(color: 2, positionX: 200, positionY: 0) */


// Configure Boxes
func createBoxUsingAutoLayout(marginValue: CGFloat, color: UIColor, heightMultiplier: CGFloat, widthMultiplier: CGFloat, leadingMarginValue: CGFloat, topMarginValue: CGFloat, bottomMarginValue: CGFloat)  {
    
    let view = UIView(frame: CGRect.zero)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = color
    canvas.addSubview(view)
    
    let margin: CGFloat = marginValue
    // Height
    NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: canvas, attribute: .height, multiplier: heightMultiplier, constant: margin).isActive = true
    // Width
    NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: canvas, attribute: .width, multiplier: widthMultiplier, constant: margin).isActive = true
    // Leading Constraint
    NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: canvas, attribute: .leading, multiplier: 1, constant: leadingMarginValue).isActive = true
    // Top Constraint
    NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: canvas, attribute: .top, multiplier: 1, constant: topMarginValue).isActive = true
    // Bottom Constraint
    NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: canvas, attribute: .bottom, multiplier: 1, constant: widthMultiplier).isActive = true
    
    PlaygroundPage.current.liveView = canvas // make the canvas appear in the assistant editor
}

let heightMultiplierValue: CGFloat = 1
let widthMultiplierValue: CGFloat = 1/3

createBoxUsingAutoLayout(marginValue: 0, color: colors[0], heightMultiplier: heightMultiplierValue, widthMultiplier: widthMultiplierValue, leadingMarginValue: 0, topMarginValue: 0, bottomMarginValue: 0)

createBoxUsingAutoLayout(marginValue: 0, color: colors[1], heightMultiplier: heightMultiplierValue, widthMultiplier: widthMultiplierValue, leadingMarginValue: 100, topMarginValue: 0, bottomMarginValue: 0)

createBoxUsingAutoLayout(marginValue: 0, color: colors[2], heightMultiplier: heightMultiplierValue, widthMultiplier: widthMultiplierValue, leadingMarginValue: 200, topMarginValue: 0, bottomMarginValue: 0)
=======
>>>>>>> 1804d074b370b0206976797c4e65f29f0a68c32e
