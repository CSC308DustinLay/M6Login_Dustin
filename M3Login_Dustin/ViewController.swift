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
    @IBOutlet weak var loginButtonOutlet: UIButton!
    
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

extension ViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        switch textField
        {
        case UNText:
            PWText.becomeFirstResponder( )
        case PWText:
            LoginButton(self)
        default:
            break
        }
        //print(#function, textField)
        return false
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
        if textField == UNText
        {
            let count = textField.text?.count ?? 0
            let isValidUN = (6...12).contains(count)
            textField.layer.borderWidth = isValidUN ? 0 : 2
            textField.layer.borderColor = isValidUN ? nil : UIColor.red.cgColor
            textField.layer.cornerRadius = isValidUN ? 0 : 5
            textField.tintColor = isValidUN ? view.tintColor : .red
            return isValidUN
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        var finalUN = UNText.text ?? ""
        var finalPW = PWText.text ?? ""
        
        if textField == UNText
        {
            guard let range = Range(range, in: finalUN) else{ return true }
            
            finalUN = finalUN.replacingCharacters(in: range, with: string)
        }
        else if textField == PWText
        {
            guard let range = Range(range, in: finalPW) else{ return true }
            
            finalPW = finalPW.replacingCharacters(in: range, with: string)
        }
        
        loginButtonOutlet.isEnabled = !finalPW.isEmpty && !finalUN.isEmpty
        //print(#function, textField.text)
        return true
    }
}
