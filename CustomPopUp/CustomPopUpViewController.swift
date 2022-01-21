//
//  CustomPopUpViewController.swift
//  CustomPopUp
//
//  Created by Joseph Kim on 2022/01/20.
//

import UIKit

class CustomPopUpViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var subscribeBtn: UIButton!
    @IBOutlet weak var bgBtn: UIButton!
    @IBOutlet weak var openChatBtn: UIButton!
    @IBOutlet weak var blogBtn: UIButton!
    
    
    var subscribeBtnCompletionClosure: (() -> Void)?
    var myPopUpDelegate: PopUpDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CustomPopUpViewController - viewDidLoad() Called")
        contentView.layer.cornerRadius = 30
        subscribeBtn.layer.cornerRadius = 10
        openChatBtn.layer.cornerRadius = 10
        blogBtn.layer.cornerRadius = 10
    }
    
    //MARK: - IBACTIONS
    
    @IBAction func onBgBtnClicked(_ sender: UIButton) {
    
        print("CustomPopUpViewController - onBgBtnClicked() Called")
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func onSubScribeBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onSubScribeBtnClicked() Called")
        self.dismiss(animated: true, completion: nil)
        //컴플리션 블럭 호출
        
        if let subscribeBtnCompletionClosure = subscribeBtnCompletionClosure{
            subscribeBtnCompletionClosure()
        }
    }
    
    
    @IBAction func onOpenChatBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onOpenChatBtnClicked() Called")
        self.dismiss(animated: true, completion: nil)
        myPopUpDelegate?.onOpenChatBtnClicked()
    }
    
    
    @IBAction func onBlogBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onBlogBtnClicked() Called")
        NotificationCenter.default.post(name: Notification.Name(rawValue: notificationName), object: nil)
        dismiss(animated: true, completion: nil)
    }
    
}
