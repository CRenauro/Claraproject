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


    //    override func viewWillAppear(_ animated: Bool) {
//        loginView.layer.cornerRadius = 12
//        loginView.layer.borderColor = UIColor(cgColor: #colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor).cgColor
//        loginView.layer.borderWidth = 2.0
//        //Image view 100x100
//        //Radius 50
//    }
    
    
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
        
        let loginURL = BASE_URL + LOGIN
        var loginRequest = URLRequest(url: URL(string: loginURL)!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 30)
        
        loginRequest.httpMethod = "POST"
        
//        loginRequest.addValue("Content-Type", forHTTPHeaderField: "application/JSON")
        
        
        //create a dictionary
        let params = ["email": emailField.text!, "password": passwordField.text!]
        
        //convert to JSON
        loginRequest.httpBody = try?JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        
        URLSession.shared.dataTask(with: loginRequest) { (data, response, error) in
            guard let Data = data, error==nil else
            {
                //switch to main thread
                return
            }
            if let httpStatus = (response as? HTTPURLResponse)
            {
                if(httpStatus.statusCode != 200)
                {
                    print(httpStatus.statusCode)
                    return
                }
            }
            // update UI on Primary Thread/Ui Thread/ main thread
            DispatchQueue.main.async {
                self.getData(data: Data)
            }
            
        }.resume()

    }
    func getData(data: Data)
    {
        self.hideIndicator()
        let response = try?JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, String>
        var token = response!["token"]
        print(token)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
