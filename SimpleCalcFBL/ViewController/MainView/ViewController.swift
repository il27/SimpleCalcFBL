//
//  ViewController.swift
//  SimpleCalcFBL
//
//  Created by Ильяс on 25.09.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Views
    private let display     = UITextField()
    private let displayView = UIView()
    private let mainVStack  = UIStackView()
    
    // MARK: - Properties
    var sevice: CalcService?
    
    // MARK: - ViewController lifecycel
    override func viewDidLoad() {
        super.viewDidLoad()
        sevice = CalcService(displayView: self)
        view.backgroundColor = .systemRed
        
        configureAppearance()
    }

    // MARK: - ViewController methods
    func updateDisplay(text: String) {
        DispatchQueue.main.async {
            self.display.text = text
        }
    }
    @objc func buttonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0...9:
            service?.numberActin(number: sender.tag)
        case 10:
            print()
//            service?.dot()
        case 11:
            service.makeResult()
        case 12:
            service?.addition()
        case 13:
            service?.substraction()
        case 14:
            service?.multiplication()
        case 15:
            service?.acAction()
        case 16:
            print()
//            service?.dot()
        case 17:
            print()
//            service?.dot()
        case 18:
            service?.division()
        default:
            break
        }
    }
}

// MARK: - ViewController private methods
private extension ViewController {
    func configureAppearance() {
        setupDisplayView()
        setupButtons()
        setupMainVStack()
    }
    func setupMainVStack() {
        mainVStack.axis = .vertical
        mainVStack.frame = CGRect(x: 0,
                                  y: 60,
                                  width: Constants.screenWidth,
                                  height: Constants.screenHeight-60)
        mainVStack.backgroundColor = .systemGreen
        
        self.view.addSubview(mainVStack)
    }
    func setupDisplayView() {
        displayView.frame = CGRect(x: 0,
                                   y: 0,
                                   width: Constants.screenWidth,
                                   height: Constants.screenHeight - (82*5) - 60 - 30)
        
        displayView.backgroundColor = .lightGray
        
        display.frame = CGRect(x: 15,
                               y: 15,
                               width: displayView.frame.width - 30,
                               height: displayView.frame.height - 15)
        
        display.textAlignment = .right
        display.contentVerticalAlignment = .bottom
        display.text = "0"
        display.textColor = .white
        display.font = UIFont.boldSystemFont(ofSize: 80)
        display.backgroundColor = .gray
        
        displayView.addSubview(display)
        mainVStack.addSubview(displayView)
    }
    func setupLineOne() {
        let lineOne = createHStack(yPosition: Int(displayView.frame.height) + 0)
        
        let acButton = creatButton(order: 0, title: "AC", tag: 15)
        acButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let changeSignButton = creatButton(order: 1, title: "+/-", tag: 16)
        changeSignButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let percentButton = creatButton(order: 2, title: "%", tag: 17)
        percentButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let divButton = creatButton(order: 3, title: "/", tag: 18)
        divButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        lineOne.addSubview(acButton)
        lineOne.addSubview(changeSignButton)
        lineOne.addSubview(percentButton)
        lineOne.addSubview(divButton)

        mainVStack.addSubview(lineOne)
    }
    func setupLineTwo() {
        let lineTwo = createHStack(yPosition: Int(displayView.frame.height) + 80 + 2)
        
        let sevenButton = creatButton(order: 0, title: "7", tag: 7)
        sevenButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let eightButton = creatButton(order: 1, title: "8", tag: 8)
        eightButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let nineButton = creatButton(order: 2, title: "9", tag: 9)
        nineButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let multButton = creatButton(order: 3, title: "*", tag: 14)
        multButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        lineTwo.addSubview(sevenButton)
        lineTwo.addSubview(eightButton)
        lineTwo.addSubview(nineButton)
        lineTwo.addSubview(multButton)
        
        mainVStack.addSubview(lineTwo)
    }
    func setupLineThree() {
        let lineThree = createHStack(yPosition: Int(displayView.frame.height) + 80 + 80 + 4)
        
        let fourButton = creatButton(order: 0, title: "4", tag: 4)
        fourButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let fiveButton = creatButton(order: 1, title: "5", tag: 5)
        fiveButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let sixBitton = creatButton(order: 2, title: "6", tag: 6)
        sixBitton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let subsNutton = creatButton(order: 3, title: "-", tag: 13)
        subsNutton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        lineThree.addSubview(fourButton)
        lineThree.addSubview(fiveButton)
        lineThree.addSubview(sixBitton)
        lineThree.addSubview(subsNutton)
        
        mainVStack.addSubview(lineThree)
    }
    func setupLineFour() {
        let lineFour = createHStack(yPosition: Int(displayView.frame.height) + 80 + 80 + 80 + 6)
        
        
        let oneButton = creatButton(order: 0, title: "1", tag: 1)
        oneButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let twoButton = creatButton(order: 1, title: "2", tag: 2)
        twoButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let threeButton = creatButton(order: 2, title: "3", tag: 3)
        threeButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let plusButton = creatButton(order: 3, title: "+", tag: 12)
        plusButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        lineFour.addSubview(oneButton)
        lineFour.addSubview(twoButton)
        lineFour.addSubview(threeButton)
        lineFour.addSubview(plusButton)
        
        mainVStack.addSubview(lineFour)
    }
    func setupLineFive() {
        let lineFive = createHStack(yPosition: Int(displayView.frame.height) + 80 + 80 + 80 + 80 + 8)
        
        let zeroButton = creatButton(order: 0, title: "0", tag: 0)
        zeroButton.frame = CGRect(x: 2, y: 0, width: (Int(Constants.screenWidth)/4)*2-2, height: 80)
        zeroButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        let dotButton = creatButton(order: 2, title: ",", tag: 18)
        dotButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let equalButton = creatButton(order: 3, title: "=", tag: 19)
        equalButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        lineFive.addSubview(zeroButton)
        lineFive.addSubview(dotButton)
        lineFive.addSubview(equalButton)
        
        mainVStack.addSubview(lineFive)
    }
    func setupButtons() {
        setupLineOne()
        setupLineTwo()
        setupLineThree()
        setupLineFour()
        setupLineFive()
    }
    func creatButton(order: Int, title: String, tag: Int) -> UIButton {
        let button = UIButton(frame: CGRect(x: (0+Int(Constants.screenWidth/4)*order+2),
                                            y: 0,
                                            width: Int(Constants.screenWidth)/4-2,
                                            height: 80))
        button.setTitle(title, for: .normal)
        button.backgroundColor = .blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.tag = tag
        
        return button
    }
    func createHStack(yPosition: Int) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.frame = CGRect(x: 0,
                             y: yPosition,
                             width: Int(Constants.screenWidth),
                             height: 80)
        return stack
    }
}
