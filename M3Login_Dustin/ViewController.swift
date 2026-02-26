//
//  ViewController.swift
//  M3Login_Dustin
//
//  Created by Heather Bishop on 2/3/26.
//

import UIKit

class ViewController: UIViewController {
    //!expression -> opposite bool
    //expression! -> forced unwrapping
    //type! -> implicitly unwrapped optional(IOU)
    @IBOutlet weak var UNText: UITextField!
    @IBOutlet weak var PWText: UITextField!
    
    @IBAction func LoginButton(_ sender: Any)
    {
        guard let userName = UNText.text, !userName.isEmpty else {showAlert(message: "Enter Username!"); return}
        guard let password = PWText.text, !password.isEmpty else {showAlert(message: "Enter Password!"); return}
        
        if userName == "DustinLAY" && password == "21laydus"
        {
            LSText.text = "Login Successful"
            ColorView.backgroundColor = .green
            ColorView.alpha = 0.5
        }
        else
        {
            LSText.text = "Login Failed"
            ColorView.backgroundColor = .red
            ColorView.alpha = 0.5
        }
    }
    @IBOutlet weak var LSText: UILabel!
    @IBOutlet weak var ColorView: UIView!
    
    func showAlert(message: String)
    {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        UNText.becomeFirstResponder( )
    }

}

