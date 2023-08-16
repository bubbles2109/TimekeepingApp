//
//  homePageController.swift
//  project1
//
//  Created by Phamcuong on 07/10/2022.
//

import UIKit

@available(iOS 13.0, *)
class homePageController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lbUsername: UILabel!
    @IBOutlet weak var lbWorkSpace: UILabel!
    @IBOutlet weak var lbSubTitile: UILabel!
    
    let accessTokenUser:UserDefaults = UserDefaults()

    var didHideNav: Bool = false
    
    let fontConstant1 = CGFloat(0.04)
    let fontConstant2 = CGFloat(0.02)
    
    let a = UserDefaults.standard.object(forKey: "user")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        lbUsername.font = lbUsername.font.withSize(self.view.frame.height * fontConstant1)
        lbWorkSpace.font = lbWorkSpace.font.withSize(self.view.frame.height * fontConstant1)
        lbSubTitile.font = lbSubTitile.font.withSize(self.view.frame.height * fontConstant2)

        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        imageView.addGestureRecognizer(tapGR)
        imageView.isUserInteractionEnabled = true
        
        print(a)
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("UIImageView tapped")
        }
    }
    @IBAction func logout(_ sender: Any) {
        accessTokenUser.removeObject(forKey: "Token")
        //user.removeObject(forKey: "user")
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "navLogin")
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    @IBAction func getManualClocking(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "manualVC") as? ManualClockingController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
