//
//  forgotPasswordController.swift
//  project1
//
//  Created by Phamcuong on 06/10/2022.
//

import UIKit

class forgotPasswordController: UIViewController {

    @IBOutlet weak var okBT: UIButton!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbSubTitle: UILabel!
    
    let fontConstant1 : CGFloat = 0.04
    let fontConstant2 : CGFloat = 0.017
    let fontConstant3 : CGFloat = 0.03
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPaddingView(strImgname: "icons8-envelope-30", txtField: emailTF)
        forgotPasswordUI()
        
        lbTitle.font = lbTitle.font.withSize(self.view.frame.height * fontConstant1)
        lbSubTitle.font = lbSubTitle.font.withSize(self.view.frame.height * fontConstant2)
        
    }
    
    func forgotPasswordUI(){
        emailTF.layer.cornerRadius = 10
        emailTF.layer.masksToBounds = true
        
        okBT.layer.cornerRadius = 10
        okBT.layer.masksToBounds = true
        
    }
    
    @IBAction func OKclick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "OTPvc") as! OTPController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setPaddingView(strImgname: String,txtField: UITextField){
            let imageView = UIImageView(image: UIImage(named: strImgname))
            imageView.frame = CGRect(x: 10, y: 2, width: imageView.image!.size.width, height: imageView.image!.size.height)
            let paddingView: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 50, height: 35))
            paddingView.addSubview(imageView)
            txtField.leftViewMode = .always
            txtField.leftView = paddingView
    }
    
    @IBAction func backBT(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
