//
//  ViewController.swift
//  CustomPopUp
//
//  Created by Joseph Kim on 2022/01/20.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func onCreatePopUpClicked(_ sender: UIButton) {
        
        print("ViewController - onCreatePopUpClieed() called")
        let stotryboard = UIStoryboard.init(name: "PoPUp", bundle: nil)
        let alertPopUpVC = stotryboard.instantiateViewController(withIdentifier: "AlertPopUpVC")
        alertPopUpVC.modalPresentationStyle = .overCurrentContext
        alertPopUpVC.modalTransitionStyle = .crossDissolve
        
        self.present(alertPopUpVC, animated: true, completion: nil)
        
    }
    
}

