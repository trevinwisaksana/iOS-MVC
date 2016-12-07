import UIKit
import PlaygroundSupport

let canvasFrame = CGRect(x: 0, y :0, width: 300, height: 300)
let canvas = UIView(frame: canvasFrame)
canvas.backgroundColor = .white
PlaygroundPage.current.liveView = canvas // make the canvas appear in the assistant editor


let colors: [UIColor] = [.green, .gray, .purple, .yellow, .red, .orange, .lightGray, .white, .blue, .cyan]

// var colorArray = []

// func createColors() -> [UIColor] {

// }



/*:
 **Task**: Create an even grid on the `canvas`, made out of squares that each are one third as wide and one third as high as the `canvas`.Use the same colors as in the picture (they are already defined for you above in the `colors` array):
 
 ![Challenge 4](./challenge4.png "Challenge 4")
 
 1. Implement above task by setting the views' `frame`s directly.
 2. Implement above task by defining _AutoLayout_ constraints programmatically.
 
 (Make sure to comment out the first implementation once you start working on the second one to avoid confusion.)
 */

func creatingSquare(color: Int, positionX: Int, positionY: Int) {
    let sizeAndPosition = CGRect(x: positionX, y: positionY, width: Int((canvas.frame.size.width) * (1/3)), height: Int((canvas.frame.size.height) * (1/3)))
    let square = UIView(frame: sizeAndPosition)
    square.backgroundColor = colors[color]
    canvas.addSubview(square)
}
 
/*

// Green Square
creatingSquare(color: 0, positionX: 0, positionY: 0)
// Brown Square
creatingSquare(color: 1, positionX: 100, positionY: 0)
// Purple Square
creatingSquare(color: 2, positionX: 200, positionY: 0)
// Yellow Square
creatingSquare(color: 3, positionX: 0, positionY: 100)
// Red Square
creatingSquare(color: 4, positionX: 100, positionY: 100)
// Orange Square
creatingSquare(color: 5, positionX: 200, positionY: 100)
// Green Square
creatingSquare(color: 6, positionX: 0, positionY: 200)
// Brown Square
creatingSquare(color: 7, positionX: 100, positionY: 200)
// Purple Square
creatingSquare(color: 8, positionX: 200, positionY: 200) */


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

let heightMultiplierValue: CGFloat = 1/3
let widthMultiplierValue: CGFloat = 1/3
var leadingMarginValue: CGFloat = 0
var topMarginValue: CGFloat = -100
var bottomMarginValue: CGFloat = 0
var colorIndex = -1

for i in 0...8 {
    colorIndex += 1
    if (i % 3 != 0) {
       leadingMarginValue += 100
    } else {
        leadingMarginValue = 0
        topMarginValue += 100
    }
    
    createBoxUsingAutoLayout(marginValue: 0, color: colors[colorIndex], heightMultiplier: heightMultiplierValue, widthMultiplier: widthMultiplierValue, leadingMarginValue: leadingMarginValue, topMarginValue: topMarginValue, bottomMarginValue: bottomMarginValue)
}



