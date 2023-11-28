//
//  TabItem2VC.swift
//  TabManExample
//
//  Created by Ümit Örs on 28.11.2023.
//

import UIKit

class TabItem2VC: UIViewController {

    @IBOutlet weak var contentTambanView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGray
        
        viewNestedInit()
    }
    func viewNestedInit(){
        guard let controller = self.storyboard?.instantiateViewController(identifier: "TabManTC") as? TabManTC else {return}
        
        handlerController(controller: controller)
    }
    
    private func handlerController(controller: UIViewController){
        addChild(controller)
        
        contentTambanView.addSubview(controller.view)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        controller.view.topAnchor.constraint(equalTo: contentTambanView.topAnchor).isActive = true
        controller.view.bottomAnchor.constraint(equalTo: contentTambanView.bottomAnchor).isActive = true
        controller.view.leadingAnchor.constraint(equalTo: contentTambanView.leadingAnchor).isActive = true
        controller.view.trailingAnchor.constraint(equalTo: contentTambanView.trailingAnchor).isActive = true
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
