//
//  ProfilePhotoSectionVC.swift
//  UXApp-YakoDesign
//
//  Created by Jacobo Ramirez on 22/02/24.
//

import UIKit

class ProfilePhotoSectionViewController: UIViewController {
    
    var profilePhotoView: UIView!
    var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        profilePhotoView = UIView()
        profilePhotoView.backgroundColor = .purple
        profilePhotoView.translatesAutoresizingMaskIntoConstraints = false
        profilePhotoView.layer.cornerRadius = 20
        profilePhotoView.clipsToBounds = true
        
        view.addSubview(profilePhotoView)
        
        NSLayoutConstraint.activate([
            profilePhotoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profilePhotoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            profilePhotoView.widthAnchor.constraint(equalToConstant: 40),
            profilePhotoView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        profileImageView = UIImageView(image: UIImage(named: "profile_photo"))
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profilePhotoView.addSubview(profileImageView)
        
        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: profilePhotoView.centerXAnchor),
            profileImageView.centerYAnchor.constraint(equalTo: profilePhotoView.centerYAnchor),
            profileImageView.widthAnchor.constraint(equalTo: profilePhotoView.widthAnchor, multiplier: 0.9),
            profileImageView.heightAnchor.constraint(equalTo: profilePhotoView.heightAnchor, multiplier: 0.9)
        ])
    }
}

