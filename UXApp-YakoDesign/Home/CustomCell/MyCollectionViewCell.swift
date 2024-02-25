//
//  MyCollectionViewCell.swift
//  UXApp-iOS-Yako
//
//  Created by Jacobo Ramirez on 7/02/24.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet var contentCollectionView: UIView!{
        didSet{
            contentCollectionView.backgroundColor = .systemGray6
            contentCollectionView.layer.cornerRadius = 25
            contentCollectionView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var titleProyect: UILabel!
    @IBOutlet weak var dateProyect: UILabel!
    @IBOutlet weak var progressProyect: UIProgressView!
    @IBOutlet weak var percentageProgressLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .clear
        progressColor(progressValue: Double(progressProyect.progress))
        
        updateProgressLabel()
    }
    
    func progressColor(progressValue: Double){
        if progressValue <= 0.33 {
            progressProyect.progressTintColor = UIColor.red
        } else if progressValue <= 0.66 {
            progressProyect.progressTintColor = UIColor.orange
        } else {
            progressProyect.progressTintColor = UIColor.green
        }
    }
    
    func updateProgressLabel() {
        let progressValue = progressProyect.progress
        let percentage = Int(progressValue * 100)
        percentageProgressLabel.text = "\(percentage)%"
    }

}
