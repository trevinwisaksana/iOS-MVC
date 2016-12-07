import UIKit
import PlaygroundSupport

// MARK: - Setup for Canvas
let canvasFrame = CGRect(x: 0, y: 0, width: 500, height: 500) // Creating the frame
let canvas = UIView(frame: canvasFrame) // Using the frame created as the canvas
canvas.backgroundColor = .white // Setting the background color white
PlaygroundPage.current.liveView = canvas // Presenting the canvas on the liveView

// MARK: - BoardView Class
class BoardView: UIView, UIGestureRecognizerDelegate {
    // TODO: - Inherit UIGestureRecognizer
    
    // MARK: - Setting the board
    // Objects to setup board
    private var boardWidth: Int! // Variable with type CGFloat
    private var boardHeight: Int! // Variable with type CGFloat
    private var fields: UIView!
    
    init(boardWidth: Int, boardHeight: Int) {
        super.init(frame: CGRect(x: 0, y: 0, width: boardWidth, height: boardHeight))
        self.boardWidth = boardWidth
        self.boardHeight = boardHeight
        
        self.backgroundColor = UIColor.white
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        
        fields = self.loopToCreateField()
        
    }
    
    // Required initializer
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting the Field
    
    // Creating Board method
    func creatingField(positionX: Int, positionY: Int) -> UIView {
        
        let widthValue = Int((self.frame.size.width) * (1/3))
        let heightValue = Int((self.frame.size.height) * (1/3))
        
        // Setup and create field
        let sizeAndPosition = CGRect(x: positionX, y: positionY, width: widthValue, height: heightValue)
        let field = UIView(frame: sizeAndPosition)
        
        // Setup field attributes
        field.backgroundColor = .white
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        
        // Setup for Tap Gesture
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(tapGesture))
        gesture.delegate = self
        field.addGestureRecognizer(gesture)
        
        // Creating a label in each field
        let labelFrame = CGRect(x: 25, y: -8, width: widthValue, height: heightValue)
        let label = UILabel.init(frame: labelFrame)
        label.font = UIFont(name: "Helvetica", size: 100)
        label.textColor = UIColor.black
        field.addSubview(label)
        
        // Adding the field to the canvas
        self.addSubview(field)
        return field
    }
    
    
    // MARK: - Tap method
    @objc private func tapGesture(sender: UITapGestureRecognizer) {
        print(sender)
        // print("Used")
        
    }

    func loopToCreateField() -> UIView {
        // TODO: - Place input of the position that will be different for each square
        var fieldCreated: UIView!
        
        // Position of the field
        var XPositionOfField = 0
        var YPositionOfField = -100
        
        // Creating the board
        for i in 0...8 {
            if (i % 3 != 0) {
                XPositionOfField += Int((self.frame.size.width) * (1/3))
            } else {
                XPositionOfField = 0
                YPositionOfField += Int((self.frame.size.height) * (1/3))
            }
            fieldCreated = self.creatingField(positionX: XPositionOfField , positionY: YPositionOfField)
        }
        
        return fieldCreated
        
    }

}

let board = BoardView(boardWidth: 300, boardHeight: 300)
canvas.addSubview(board)
board.center = canvas.center


