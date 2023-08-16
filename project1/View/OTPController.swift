//
//  OTPController.swift
//  project1
//
//  Created by Phamcuong on 07/10/2022.
//

import UIKit

class OTPController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtOTP1: UITextField!
    @IBOutlet weak var txtOTP2: UITextField!
    @IBOutlet weak var txtOTP3: UITextField!
    @IBOutlet weak var txtOTP4: UITextField!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var otpUI: UIView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbSubTitle: UILabel!
    
    let fontConstant1 = CGFloat(0.04)
    let fontConstant2 = CGFloat(0.017)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        txtOTP1.backgroundColor = UIColor.clear
//        txtOTP2.backgroundColor = UIColor.clear
//        txtOTP3.backgroundColor = UIColor.clear
//        txtOTP4.backgroundColor = UIColor.clear
        okButton.layer.cornerRadius = 10
        otpUI.layer.cornerRadius = 15
        
        lbTitle.font = lbTitle.font.withSize(self.view.frame.height * fontConstant1)
        lbSubTitle.font = lbSubTitle.font.withSize(self.view.frame.height * fontConstant2)
        
        addBorder(textField: txtOTP1)
        addBorder(textField: txtOTP2)
        addBorder(textField: txtOTP3)
        addBorder(textField: txtOTP4)
        
        txtOTP1.delegate = self
        txtOTP2.delegate = self
        txtOTP3.delegate = self
        txtOTP4.delegate = self
        
        txtOTP1.becomeFirstResponder()
        
        print(txtOTP1.frame.size.width)
        // Do any additional setup after loading the view.
    }
    
    
    
    func addBorder(textField: UITextField){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: textField.frame.size.height - 2.0, width: textField.frame.size.width, height: 2.0)
            bottomLine.backgroundColor = UIColor.gray.cgColor
            textField.borderStyle = .none
            textField.layer.addSublayer(bottomLine)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((textField.text?.count)! < 1) && (string.count > 0){
            if textField == txtOTP1 {
                txtOTP2.becomeFirstResponder()
            }
            if textField == txtOTP2 {
                txtOTP3.becomeFirstResponder()
            }
            if textField == txtOTP3 {
                txtOTP4.becomeFirstResponder()
            }
            if textField == txtOTP4 {
                txtOTP4.resignFirstResponder()
            }
            textField.text = string
            return false
        }
        else if ((textField.text?.count)! >= 1) && (string.count == 0) {
            if textField == txtOTP2 {
                txtOTP1.becomeFirstResponder()
            }
            if textField == txtOTP3 {
                txtOTP2.becomeFirstResponder()
            }
            if textField == txtOTP4 {
                txtOTP3.becomeFirstResponder()
            }
            if textField == txtOTP1 {
                txtOTP1.resignFirstResponder()
            }
            textField.text = ""
            return false
        }else if (textField.text!.count >= 1){
            textField.text = string
            return false
        }
        return true
    }
    
    @IBAction func clickOK(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "resetPasswordVC") as! resetPasswordController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func resendOTP(_ sender: Any) {
        
    }
    
}
