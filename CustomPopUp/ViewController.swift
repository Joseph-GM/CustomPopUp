//
//  ViewController.swift
//  CustomPopUp
//
//  Created by Joseph Kim on 2022/01/20.
//

import UIKit
import WebKit

let notificationName = "btnClickNotification"

class ViewController: UIViewController, PopUpDelegate {
   
    

    @IBOutlet weak var myWebView: WKWebView!
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(loadWebView), name: NSNotification.Name(rawValue: notificationName), object: nil)
        // Do any additional setup after loading the view.
    }

    @objc fileprivate func loadWebView() {
        print("ViewController - loadWebVeie() called")
        let myChannelUrl = URL(string: "https://velog.io/@jjbrother")
        self.myWebView.load(URLRequest(url: myChannelUrl!))
    }
    @IBAction func onCreatePopUpClicked(_ sender: UIButton) {
        
        print("ViewController - onCreatePopUpClieed() called")
        let stotryboard = UIStoryboard.init(name: "PoPUp", bundle: nil)
        let customPopUpVC = stotryboard.instantiateViewController(withIdentifier: "AlertPopUpVC") as! CustomPopUpViewController
        customPopUpVC.modalPresentationStyle = .overCurrentContext
        customPopUpVC.modalTransitionStyle = .crossDissolve
        customPopUpVC.subscribeBtnCompletionClosure = {
            
            print("컴플리션 블럭이 호출되었다.")
            let myChannelUrl = URL(string: "https://www.naver.com")
            self.myWebView.load(URLRequest(url: myChannelUrl!))
            
        }
        customPopUpVC.myPopUpDelegate = self
        self.present(customPopUpVC, animated: true, completion: nil)
        
    }
    //MARK: PopUpDelegate method
    func onOpenChatBtnClicked() {
        print("ViewController - onOpenChatBtnClicked() called")
        let myChannelUrl = URL(string: "https://www.daum.net")
        self.myWebView.load(URLRequest(url: myChannelUrl!))
    }
    
}

