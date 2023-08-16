//
//  changePasswordController.swift
//  project1
//
//  Created by Phamcuong on 07/10/2022.
//

import UIKit

class resetPasswordController: UIViewController {

    @IBOutlet weak var newPasswordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var okBT: UIButton!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbSubTitle: UILabel!
    @IBOutlet weak var lbNewPassword: UILabel!
    @IBOutlet weak var lbConfirmPassword: UILabel!
    
    let fontConstant1 = CGFloat(0.04)
    let fontConstant2 = CGFloat(0.025)
    let fontConstant3 = CGFloat(0.02)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbTitle.font = lbTitle.font.withSize(self.view.frame.height * fontConstant1)
        lbSubTitle.font = lbSubTitle.font.withSize(self.view.frame.height * fontConstant2)
        lbNewPassword.font = lbNewPassword.font.withSize(self.view.frame.height * fontConstant3)
        lbConfirmPassword.font = lbConfirmPassword.font.withSize(self.view.frame.height * fontConstant3)
        
        setPaddingRightView(txtField: newPasswordTF)
        setPaddingRightView(txtField: confirmPasswordTF)
        
        changePasswordUI()
        
        setPaddingLeftView(txtField: newPasswordTF)
        setPaddingLeftView(txtField: confirmPasswordTF)
        // Do any additional setup after loading the view.
    }
    func changePasswordUI(){
        okBT.layer.cornerRadius = 10
        newPasswordTF.layer.cornerRadius = 10
        confirmPasswordTF.layer.cornerRadius = 10
    }
    
    func setPaddingLeftView(txtField: UITextField){
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        txtField.leftView = paddingView
        txtField.leftViewMode = .always
    }
    
    func setPaddingRightView(txtField: UITextField){
        let imageView = UIButton(type: .custom)
        imageView.setImage(UIImage(named: "icons8-eye-50"), for: .normal)
        imageView.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 10)
        imageView.frame = CGRect(x: CGFloat(txtField.frame.size.width - 25), y: 5, width: CGFloat(15), height: CGFloat(25))
        imageView.addTarget(self, action: #selector(self.btnEntryNewPassword), for: .touchUpInside)
        txtField.rightViewMode = .always
        txtField.rightView = imageView
    }
    
    @objc func btnEntryNewPassword(_ sender: Any){
        if (sender as! UIButton).isSelected{
            self.newPasswordTF.isSecureTextEntry = true
        }else{
            self.newPasswordTF.isSecureTextEntry = false
        }
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
    }
    
    @available(iOS 13.0, *)
    @IBAction func clickOK(_ sender: Any) {
        
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "clockInOutVC") as! ClockInOutController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
