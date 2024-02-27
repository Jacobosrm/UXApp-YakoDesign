
import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet var contentTableView: UIView!{
        didSet{
            contentTableView.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var contentTaskView: UIView!{
        didSet{
            contentTaskView.backgroundColor = .systemGray6
            contentTaskView.layer.cornerRadius = 10
            contentTaskView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var checkButton: UIButton! {
        didSet {
            
            let uncheckedImage = UIImage(systemName: "square")
            checkButton.setImage(uncheckedImage, for: .normal)
            
            let checkedImage = UIImage(systemName: "checkmark.square.fill")
            checkButton.setImage(checkedImage, for: .selected)
            
            checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var activityLabel: UILabel!
    
    @IBOutlet weak var timeTakeLabel: UILabel!{
        didSet{
            timeTakeLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }
    
    @objc func checkButtonTapped() {
        checkButton.isSelected = !checkButton.isSelected
    }
    
    func configureMyTableViewCell(with activity: Activity){
        timeTakeLabel.text = activity.hour
        activityLabel?.text = activity.title
    }
}
