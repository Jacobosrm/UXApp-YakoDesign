
import UIKit

struct Proyect{
    let title: String
    let date: String
    let progress: Double
}

struct Activity{
    let hour: String
    let title: String
}

class HomeViewController: UIViewController{
    
    @IBOutlet weak var profilePhotoView: UIView!{
        didSet{
            profilePhotoView.backgroundColor = UIColor(named: "personalPurple")
            profilePhotoView.layer.cornerRadius = 23
            profilePhotoView.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var profileImageView: UIImageView!{
        didSet{
            profileImageView.image = UIImage(named: "profile_photo")
            profileImageView.contentMode = .scaleAspectFit
        }
    }
    
    @IBOutlet weak var proyectCollectionView: UICollectionView!{
        didSet{
            proyectCollectionView.delegate = self
            proyectCollectionView.dataSource = self
            
            let nib = UINib(nibName: "MyCollectionViewCell", bundle: nil)
            proyectCollectionView.register(nib, forCellWithReuseIdentifier: "collectionCell")
            
            let layout = proyectCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
            layout?.itemSize = CGSizeMake(250, 120)
            proyectCollectionView.backgroundColor = .clear
        }
    }

    @IBOutlet weak var taskTableView: UITableView!{
        didSet{
            taskTableView.delegate = self
            taskTableView.dataSource = self
            
            let nib = UINib(nibName: "MyTableViewCell", bundle: nil)
            taskTableView.register(nib, forCellReuseIdentifier: "tableCell")
            
            taskTableView.backgroundColor = .clear
        }
    }
    
    
    @IBOutlet weak var purpleCircleView: UIView!{
        didSet{
            purpleCircleView.backgroundColor = UIColor(named: "personalPurple")
            purpleCircleView.layer.cornerRadius = purpleCircleView.bounds.width / 2
            purpleCircleView.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var greenCircleView: UIView!{
        didSet{
            greenCircleView.backgroundColor = UIColor(named: "personalGreen")
            greenCircleView.layer.cornerRadius = greenCircleView.bounds.width / 2
            greenCircleView.clipsToBounds = true
        }
    }

    
    var proyectsContent: [Proyect] = [
        Proyect(title: "Yako Planet App", date: "09-09-09", progress: 0.25),
        Proyect(title: "Yako Design", date: "10-10-10", progress: 0.50),
        Proyect(title: "Yako Extra App", date: "11-11-11", progress: 0.75),
        Proyect(title: "Yako Extra", date: "12-12-12", progress: 0.90)
    ]
    
    var activityContent: [Activity] = [
        Activity(hour: "1 hora", title: "Crear interfaz de usuario en tu Storyboard"),
        Activity(hour: "2 horas", title: "Conectar la vista de la celda y la vista del controlador"),
        Activity(hour: "3 horas", title: "Crear interfaz de usuario en tu Storyboard"),
        Activity(hour: "4 horas", title: "Conectar la vista de la celda y la vista del controlador")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "personalBackgound")
    }
    
    init(){
        super.init(nibName: "HomeView", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCustomCollectionCell(){
        let nib = UINib(nibName: "MyCollectionViewCell", bundle: nil)
        proyectCollectionView.register(nib, forCellWithReuseIdentifier: "collectionCell")
    }
    func setupCustomTableCell(){
        let nib = UINib(nibName: "MyTableViewCell", bundle: nil)
        taskTableView.register(nib, forCellReuseIdentifier: "tableCell")
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return proyectsContent.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! MyCollectionViewCell
        
        let currentProyect = proyectsContent[indexPath.row]
        cell.configureMyCollectionViewCell(with: currentProyect)

        return cell
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activityContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! MyTableViewCell
        
        let currentActivity = activityContent[indexPath.row]
        cell.configureMyTableViewCell(with: currentActivity)
        
        return cell
    }
}
