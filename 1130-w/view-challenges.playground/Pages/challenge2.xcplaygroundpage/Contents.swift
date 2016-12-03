
import UIKit
import PlaygroundSupport

let canvasFrame = CGRect(x: 0, y :0, width: 300, height: 300)
let canvas = UIView(frame: canvasFrame)
canvas.backgroundColor = .white
PlaygroundPage.current.liveView = canvas // make the canvas appear in the assistant editor

/*:
 **Task**: Add three `UIView`s to the `canvas`. Each of these views should be square and have a third of the `canvas`' `width` and `height`. 
 
 
 ![Challenge 2](./challenge2.png "Challenge 2")
 
 1. Implement above task by setting the views' `frame`s directly.
 2. Implement above task by defining _AutoLayout_ constraints programmatically.
 
 (Make sure to comment out the first implementation once you start working on the second one to avoid confusion.)
 */
/* let widthValue = Int((canvas.frame.size.width) * (1/3))
let heightValue = Int((canvas.frame.size.height) * (1/3))

let firstSqrRect = CGRect(x: 0, y: 0, width: widthValue, height: heightValue)
let firstSqr = UIView(frame: firstSqrRect)
firstSqr.backgroundColor = .red
canvas.addSubview(firstSqr)

let secondSqrRect = CGRect(x: 100, y: 100, width: widthValue, height: heightValue)
let secondSqr = UIView(frame: secondSqrRect)
secondSqr.backgroundColor = .red
canvas.addSubview(secondSqr)

let thirdSqrRect = CGRect(x: 200, y: 200, width: widthValue, height: heightValue)
let thirdSqr = UIView(frame: thirdSqrRect)
thirdSqr.backgroundColor = .red
canvas.addSubview(thirdSqr) */


// Configure Boxes
func createBoxUsingAutoLayout(marginValue: CGFloat, color: UIColor, heightMultiplier: CGFloat, bottomMultiplier: CGFloat, leadingMarginValue: CGFloat, topMarginValue: CGFloat, bottomMarginValue: CGFloat)  {
    
    let view = UIView(frame: CGRect.zero)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .red
    canvas.addSubview(view)
    
    let margin: CGFloat = marginValue
    // Height
    NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: canvas, attribute: .height, multiplier: heightMultiplier, constant: margin).isActive = true
    // Width
    NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: canvas, attribute: .width, multiplier: bottomMultiplier, constant: margin).isActive = true
    // Leading Constraint
    NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: canvas, attribute: .leading, multiplier: 1, constant: leadingMarginValue).isActive = true
    // Top Constraint
    NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: canvas, attribute: .top, multiplier: 1, constant: topMarginValue).isActive = true
    // Bottom Constraint
    NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: canvas, attribute: .bottom, multiplier: 1, constant: bottomMultiplier).isActive = true
    
    PlaygroundPage.current.liveView = canvas // make the canvas appear in the assistant editor
}

let heightMultiplierValue: CGFloat = 1/3
let bottomMultiplierValue: CGFloat = 1/3

createBoxUsingAutoLayout(marginValue: 0, color: .red, heightMultiplier: heightMultiplierValue, bottomMultiplier: bottomMultiplierValue, leadingMarginValue: 0, topMarginValue: 0, bottomMarginValue: 0)

createBoxUsingAutoLayout(marginValue: 0, color: .red, heightMultiplier: heightMultiplierValue, bottomMultiplier: bottomMultiplierValue, leadingMarginValue: 100, topMarginValue: 100, bottomMarginValue: 0)

createBoxUsingAutoLayout(marginValue: 0, color: .red, heightMultiplier: heightMultiplierValue, bottomMultiplier: bottomMultiplierValue, leadingMarginValue: 200, topMarginValue: 200, bottomMarginValue: 0)


