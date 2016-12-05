import UIKit
import PlaygroundSupport

let canvasFrame = CGRect(x: 0, y :0, width: 400, height: 200)
let canvas = UIView(frame: canvasFrame)
canvas.backgroundColor = .white
PlaygroundPage.current.liveView = canvas // make the canvas appear in the assistant editor


/*:
 **Task**: Add two `UIView`s to the `canvas`. The positioning and size of the two views have the following requirements:
 
 - the **blue** view should have a _margin_ of 20 points each to the _top_ and to the _leading_ (left) edge; it should further be square and have half the `height` as the `canvas`
 - the **green** view should have a _margin_ of 20 points each to the _bottom_ and to the _trailing_ (right) edge; it should further be square and have half the `height` as the `canvas`
 
 ![Challenge 6](./challenge6.png "Challenge 6")
 
 1. Implement above task by setting the views' `frame`s directly.
 2. Implement above task by defining _AutoLayout_ constraints programmatically.
 
 (Make sure to comment out the first implementation once you start working on the second one to avoid confusion.)
 */
<<<<<<< HEAD
func creatingSquare(color: UIColor, positionX: Int, positionY: Int, widthValue: Int, heightValue: Int) {
    let sizeAndPosition = CGRect(x: positionX, y: positionY, width: widthValue, height: heightValue)
    let square = UIView(frame: sizeAndPosition)
    square.backgroundColor = color
    canvas.addSubview(square)
}

creatingSquare(color: .blue, positionX: 20, positionY: 20, widthValue: 100, heightValue: 100)
creatingSquare(color: .green, positionX: 280, positionY: 80, widthValue: 100, heightValue: 100)
=======

>>>>>>> 1804d074b370b0206976797c4e65f29f0a68c32e
