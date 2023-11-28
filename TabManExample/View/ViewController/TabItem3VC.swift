//
//  TabItem3VC.swift
//  TabManExample
//
//  Created by Ümit Örs on 28.11.2023.
//

import UIKit

class TabItem3VC: UIViewController {
    @IBOutlet weak var contentCustomTabView: UIView!
    @IBOutlet weak var tabItem1ConstraintBottom: NSLayoutConstraint!
    @IBOutlet weak var tabItem2ConstraintBottom: NSLayoutConstraint!
    @IBOutlet weak var tabItem3ConstraintBottom: NSLayoutConstraint!
    
    @IBOutlet weak var tablayout1Label: UILabel!
    @IBOutlet weak var tablayout2Label: UILabel!
    @IBOutlet weak var tablayout3Label: UILabel!
    
    
    @IBOutlet weak var tabLayoutStack: UIStackView!
    @IBOutlet weak var tab1View: UIView!
    @IBOutlet weak var tab2View: UIView!
    @IBOutlet weak var tab3View: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tablayout1Label.textColor = .tintColor
        tablayout2Label.textColor = .tintColor
        tablayout3Label.textColor = .tintColor
        //tablayoutSecilen.backgroundColor = UIColor.tablayoutsekmerenk
        
        
        
        tabLayoutStack.backgroundColor = .cyan
        tablayout1Label.backgroundColor = .black
        tablayout2Label.backgroundColor = .black
        tablayout3Label.backgroundColor = .black
        
        let g1 = UITapGestureRecognizer(target: self, action: #selector(tab1Function))
        let g2 = UITapGestureRecognizer(target: self, action: #selector(tab2Function))
        let g3 = UITapGestureRecognizer(target: self, action: #selector(tab3Function))
        let gestureArray = [g1,g2,g3]
        let tabArray = [tab1View,tab2View,tab3View]
        for i in 0...tabArray.count - 1 {
            tabArray[i]!.isUserInteractionEnabled = true
            tabArray[i]!.addGestureRecognizer(gestureArray[i])
        }
        DispatchQueue.main.async {
            self.tab1Function()
        }
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunction(gesture:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunction(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    private var typeControl = 0
    @objc func swipeFunction(gesture: UISwipeGestureRecognizer){
        if gesture.direction == .right {
            //Back
            if typeControl == 2 {
                tab2Function()
            }else if typeControl == 1 {
                tab1Function()
            }
            
        }else {
            //Next
            if typeControl == 0 {
                tab2Function()
            }else if typeControl == 1 {
                tab3Function()
            }
        }
        
    }
    @objc func tab1Function(){
        typeControl = 0
        tabItem1ConstraintBottom.constant = 2.0
        tabItem2ConstraintBottom.constant = 0
        tabItem3ConstraintBottom.constant = 0
        guard let controller = self.storyboard?.instantiateViewController(identifier: "Example1VC") as? Example1VC else {return}
        
        handlerController(controller: controller)
    }
    @objc func tab2Function(){
        typeControl = 1
        tabItem1ConstraintBottom.constant = 0
        tabItem2ConstraintBottom.constant = 2.0
        tabItem3ConstraintBottom.constant = 0
        guard let controller = self.storyboard?.instantiateViewController(identifier: "Example2VC") as? Example2VC else {return}
        
        handlerController(controller: controller)
    }
    @objc func tab3Function(){
        typeControl = 2
        tabItem1ConstraintBottom.constant = 0
        tabItem2ConstraintBottom.constant = 0
        tabItem3ConstraintBottom.constant = 2.0
        guard let controller = self.storyboard?.instantiateViewController(identifier: "Example3VC") as? Example3VC else {return}
        
        handlerController(controller: controller)
    }
    
    private func handlerController(controller: UIViewController){
        addChild(controller)
        
        contentCustomTabView.addSubview(controller.view)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        controller.view.topAnchor.constraint(equalTo: contentCustomTabView.topAnchor).isActive = true
        controller.view.bottomAnchor.constraint(equalTo: contentCustomTabView.bottomAnchor).isActive = true
        controller.view.leadingAnchor.constraint(equalTo: contentCustomTabView.leadingAnchor).isActive = true
        controller.view.trailingAnchor.constraint(equalTo: contentCustomTabView.trailingAnchor).isActive = true
        //controller.didMove(toParent: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
