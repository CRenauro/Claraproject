//
//  LoginViewController.swift
//  Claraproject
//
//  Created by Clara Renauro on 2/1/22.
//

import UIKit

class LoginViewController: UIViewController {
    

    @IBOutlet weak var loginView: UIView!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor, UIColor(red: 9/255, green: 168/255, blue: 157/255, alpha: 1).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5) // Left
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5) // Right

    }

    override func viewDidAppear(_ animated: Bool) {
//        var network = "NA"
//        if(network != "available"){
////          showAlert(title: "Network Alert", message: "Please check your network, you are not connected")  //keep commented out , use this one or below
//
//            showIndicator(message: "Network Not Found")
//        }
    }
    
    @IBAction func alert(_ sender: Any) {
        
    }

    
    @IBAction func emailField(_ sender: Any) {
    }
    

    @IBAction func passwordField(_ sender: UITextField) {
    }
    
    
    @IBAction func loginUser(_ sender: Any) {
        if emailField.text!.isEmpty || passwordField.text!.isEmpty
        {
           showAlert(title: "Try Again", message: "Email and Password are mandatory")
            return
        }
        if Utilities.isNetworkAvailable() == false
        {
            showAlert(title: "Network error", message:  "No internet connection")
            return
        }
        self.showIndicator(message: "Authenticating")
        let loginURL = URL(string: "https://reqres.in/api/login")
        var loginRequest = URLRequest(url: loginURL!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 30)
        loginRequest.httpMethod = "POST"
        loginRequest.addValue("application/JSON", forHTTPHeaderField: "Content-Type")
        let params = ["email":emailField.text, "password":passwordField.text] as! Dictionary<String, String>
        loginRequest.httpBody = try?JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        
        URLSession.shared.dataTask(with: loginRequest) { (data, response, error) in
            guard error==nil else
            {
                //switch to main thread
                print (error as Any)
                return
            }
            let status = (response as! HTTPURLResponse).statusCode
            guard status == 200 else
            {
                    print(status)
                    return
                
            }
            if let Data = data{
                DispatchQueue.main.async {
                    self.getData(data: Data)
                }
                print(NSHomeDirectory())
            }
            
        }.resume()

    }
    func getData(data: Data)
    {
        self.hideIndicator()
        let response = try?JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, String>
        let token = response!["token"]
        print(token!)
        
        UserDefaults.standard.setValue(token, forKey: "TOKEN")
        
        
        
        if let TOK = UserDefaults.standard.string(forKey: "TOKEN")
                    {
            print(TOK)
        }
        
        
        // navigation using manual segues
        self.performSegue(withIdentifier: "LoginSegue", sender: nil)
        //  clear if the app allows logout feature. Otherwise defaults will be cleared on uninstallation
        //  UserDefaults.resetStandardUserDefaults()
        //remove individual options from user defaults
        //UserDefaults.standard.removeObject(forKey: "TOKEN")
        
        
        
    }
    
}
