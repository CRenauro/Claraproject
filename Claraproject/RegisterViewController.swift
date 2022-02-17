//
//  RegisterViewController.swift
//  Claraproject
//
//  Created by Clara Renauro on 2/1/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var clickButton: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor, UIColor(red: 9/255, green: 168/255, blue: 157/255, alpha: 1).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5) // Left
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5) // Right
        // Do any additional setup after loading the view.
    }

    
    @IBAction func register(_ sender: UIButton) {
        
        let firstName = firstName.text
        let lastName = lastName.text
        let password = password.text
        let providedEmailAddress = email.text
        
        let isEmailAddressValid = isValidEmailAddress(emailAddressString: providedEmailAddress!)
        
        if isEmailAddressValid
        {
            print("valid")
        } else {
            print("not valid")
        }
         
        if (clickButton.isEnabled == true && isValidEmailAddress(emailAddressString: providedEmailAddress!)){
            let alertController = UIAlertController(title: "Welcome!", message: "You are now registered", preferredStyle: .alert)

                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in

                        // Code in this block will trigger when OK button tapped.
                        print("Ok button tapped");

                    }

                    alertController.addAction(OKAction)

                    self.present(alertController, animated: true, completion:nil)
            
        } else {
            let alert = UIAlertController(title: "Alert!", message: "You cannot register!", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "cancel", style: .destructive, handler: nil)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }
       
    }
    
    @IBAction func onOff(_ sender: UISwitch) {
        if (sender.isOn == true){
            clickButton.isEnabled = true
        } else {
            clickButton.isEnabled = false
        }
        
    }
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
      
      var returnValue = true
      let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
      
      do {
          let regex = try NSRegularExpression(pattern: emailRegEx)
          let nsString = emailAddressString as NSString
          let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
          
          if results.count == 0
          {
              returnValue = false
          }
          
      } catch let error as NSError {
          print("invalid regex: \(error.localizedDescription)")
          returnValue = false
      }
      
      return  returnValue
    }

    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
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
