//
//  ProfileViewController.swift
//  Claraproject
//
//  Created by Clara Renauro on 2/3/22.
//

import UIKit


class ProfileViewController: UIViewController {
    

    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var cardView: UIView!

    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    var user : User!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor, UIColor(red: 9/255, green: 168/255, blue: 157/255, alpha: 1).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5) // Left
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5) // Right
        
        
        ///
            getUser()
        ///
    }


    @IBAction func logOut(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cardView.layer.cornerRadius = 12
        cardView.layer.borderColor = UIColor(cgColor: #colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor).cgColor
        cardView.layer.borderWidth = 2.0
        //Image view 100x100
        //Radius 50
//        self.imageView.layer.cornerRadius=self.imageView.frame.size.width/2
//        self.imageView.clipsToBounds = true
//        self.imageView.layer.borderColor = UIColor(cgColor: #colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor).cgColor
//        self.imageView.layer.borderWidth = 2
        
    }

    func getUser()
    {
        
        let userURL = URL(string: BASE_URL+PERSON)!
        let userRequest = URLRequest(url: userURL, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
        
        URLSession.shared.dataTask(with: userRequest){
            (data, response, error) in
            guard let Data = data, error==nil
            else
            {
                print(error as Any)
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
            DispatchQueue.main.async
            {
                    self.extractData(data: Data)
            }
        }.resume()
        
    }
    func extractData(data: Data){
        print("Got data!")
        hideIndicator()
        let user1 = try? JSONDecoder().decode(Result2.self, from: data)
        print(user1!)
        self.user = user1!.data
        firstNameLabel.text = user!.first_name
        lastNameLabel.text = user!.last_name
        emailLabel.text = user!.email
        userImage!.image = Downloader.downloadImageWithURL(url: user!.avatar)
//        userImage.image = UIImage(Data: user!.avatar)
        print(user!.first_name)
        
      }
    
 
 
}
