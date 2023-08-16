//
//  changePasswordController.swift
//  project1
//
//  Created by Phamcuong on 11/10/2022.
//

import UIKit

class changePasswordController: UIViewController {

    @IBOutlet weak var currentPasswordTF: UITextField!
    @IBOutlet weak var newPasswordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
    var iconEye1 = true
    var iconEye2 = true
    var iconEye3 = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func entryCurrentPassword(_ sender: Any) {
        if iconEye1 == true {
            currentPasswordTF.isSecureTextEntry = false
        }
        else{
            currentPasswordTF.isSecureTextEntry = true
        }
        iconEye1 = !iconEye1
    }
    
    @IBAction func entryNewPassword(_ sender: Any) {
        if iconEye2 == true {
            newPasswordTF.isSecureTextEntry = false
        }
        else{
            newPasswordTF.isSecureTextEntry = true
        }
        iconEye2 = !iconEye2
    }
    
    @IBAction func entryConfirmPassword(_ sender: Any) {
        if iconEye3 == true {
            confirmPasswordTF.isSecureTextEntry = false
        }
        else{
            confirmPasswordTF.isSecureTextEntry = true
        }
        iconEye3 = !iconEye3
    }
    
    @IBAction func backClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
