//
//  ProfileViewController.swift
//  Claraproject
//
//  Created by Clara Renauro on 2/3/22.
//

import UIKit


class ProfileViewController: UIViewController {
    

    var users = [User]()
    
    
    @IBOutlet weak var userView: ProfileView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor, UIColor(red: 9/255, green: 168/255, blue: 157/255, alpha: 1).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5) // Left
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5) // Right
        

        
//        userName.text = user!.first_name + "" + user!.last_name
//        userEmail.text = user!.email
//        userImage.image = Downloader.downloadImageWithURL(url: user!.avatar)
        
            getUser()
        
        

    }


    @IBAction func logOut(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if users.isEmpty
        {
            getUser()
        }
    }
    
    
    
    func getUser()
    {
        
        let userURL = URL(string: BASE_URL + USERS)!
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
        let users = try? JSONDecoder().decode(Result.self, from: data)
//          print(users?.total)
          self.users = users!.data
//          userView.reloadData()
      }
        
 
 
}
