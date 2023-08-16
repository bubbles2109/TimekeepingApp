//
//  ClockInOutController.swift
//  project1
//
//  Created by Phamcuong on 12/10/2022.
//

import UIKit

@available(iOS 13.0, *)
class ClockInOutController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lbUserName: UILabel!
    @IBOutlet weak var lbRole: UILabel!
    @IBOutlet weak var lbWorkspace: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbStatus: UILabel!
    @IBOutlet weak var txtViewClockout: UITextView!
    
    let fontConstant1 = CGFloat(0.04)
    let fontConstant2 = CGFloat(0.02)
    let fontConstant3 = CGFloat(0.015)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtViewClockout.backgroundColor = UIColor.clear
        
        fontSize()
        
        txtViewClockout.font = UIFont.preferredFont(forTextStyle: .headline)
        
        txtViewClockout.delegate = self
                
        //Set attributedText và link cho textView
        let mutableAttributedString = NSMutableAttributedString(string: "Don't want to clock in? Clock out")
        mutableAttributedString.setAsLink(textToFind: "Clock out", linkName: "term")
        txtViewClockout.attributedText = mutableAttributedString
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        imageView.addGestureRecognizer(tapGR)
        imageView.isUserInteractionEnabled = true

    }
    
    func fontSize(){
        lbUserName.font = lbUserName.font.withSize(self.view.frame.height * fontConstant1)
        lbRole.font = lbRole.font.withSize(self.view.frame.height * fontConstant2)
        lbWorkspace.font = lbWorkspace.font.withSize(self.view.frame.height * fontConstant2)
        lbTime.font = lbTime.font.withSize(self.view.frame.height * fontConstant2)
        lbStatus.font = lbStatus.font.withSize(self.view.frame.height * fontConstant3)
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("UIImageView tapped")
        }
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
            if URL.absoluteString == "term" {
                //Action khi tap Điều khoản sử dụng
                let vc = storyboard?.instantiateViewController(withIdentifier: "homeVC") as! homePageController
                self.navigationController?.pushViewController(vc, animated: true)
                return true
            }
            return false
        }

}

extension NSMutableAttributedString {
    func setAsLink(textToFind:String, linkName:String) {
        let foundRange = self.mutableString.range(of: textToFind)
        if foundRange.location != NSNotFound {
            self.addAttribute(NSAttributedString.Key.link, value: linkName, range: foundRange)
        }
    }
}
