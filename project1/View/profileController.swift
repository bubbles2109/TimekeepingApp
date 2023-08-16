//
//  profileController.swift
//  project1
//
//  Created by Phamcuong on 11/10/2022.
//

import UIKit

class profileController: UIViewController {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbUserName: UILabel!
    @IBOutlet weak var lbRole: UILabel!
    @IBOutlet weak var lbWorkspace: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnChangePassword: UIButton!
    
    let fontConstant1 = CGFloat(0.04)
    let fontConstant2 = CGFloat(0.02)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbTitle.font = lbTitle.font.withSize(self.view.frame.height * fontConstant1)
        lbUserName.font = lbUserName.font.withSize(self.view.frame.height * fontConstant1)
        lbRole.font = lbRole.font.withSize(self.view.frame.height * fontConstant2)
        lbWorkspace.font = lbWorkspace.font.withSize(self.view.frame.height * fontConstant2)
       
    }
    
    @IBAction func backClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "editProfileVC") as! editProfileController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func changePassClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "changePasswordVC") as! changePasswordController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
