//
//  TabManTC.swift
//  TabManExample
//
//  Created by Ümit Örs on 28.11.2023.
//

import UIKit
import Tabman
import Pageboy

class TabManTC: TabmanViewController {
    private var viewControllers : [UIViewController] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGray
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc1 = sb.instantiateViewController(identifier: "Example1VC") as! Example1VC
        let vc2 = sb.instantiateViewController(identifier: "Example2VC") as! Example2VC
        let vc3 = sb.instantiateViewController(identifier: "Example3VC") as! Example3VC
        viewControllers = [vc1,vc2,vc3]
        self.dataSource = self
        
        // Create bar
        let bar = TMBar.ButtonBar()
        
        bar.backgroundView.style = .clear
        bar.backgroundColor = .systemTeal
        bar.indicator.tintColor = .systemBrown
        bar.indicator.weight = .light
        bar.layout.transitionStyle = .snap // Customize
        bar.layout.contentMode = .fit
        bar.layout.interButtonSpacing = 0
        bar.buttons.customize { (button) in
            button.tintColor = .black
            button.selectedTintColor = .white
            button.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        }
        
        
        
        addBar(bar, dataSource: self, at: .top)
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
extension TabManTC: PageboyViewControllerDataSource, TMBarDataSource {
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        if index == 0 {
            return TMBarItem(title: "Ex.1")
        }else if index == 1 {
            return TMBarItem(title: "Ex.2")
        }
        return TMBarItem(title: "Ex.3")
    }
}
