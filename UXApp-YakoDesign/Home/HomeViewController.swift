//
//  HomeViewController.swift
//  UXApp-iOS-Yako
//
//  Created by Jacobo Ramirez on 7/02/24.
//

import UIKit

struct Proyect{
    let title: String
    let date: String
    let progress: Double
}

struct Task{
    let hour: String
    let title: String
}

class HomeViewController: UIViewController{
    
    @IBOutlet weak var profilePhotoView: UIView!{
        didSet{
            profilePhotoView.backgroundColor = .personalPurple
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
            let layout = proyectCollectionView.collectionViewLayout as? UICollectionViewFlowLayout

            layout?.itemSize = CGSizeMake(250, 120)
            proyectCollectionView.backgroundColor = .clear
            
        }
    }

    @IBOutlet weak var taskTableView: UITableView!{
        didSet{
            taskTableView.backgroundColor = .clear
        }
    }
    
    
    @IBOutlet weak var purpleCircleView: UIView!{
        didSet{
            purpleCircleView.backgroundColor = .personalPurple
            purpleCircleView.layer.cornerRadius = purpleCircleView.bounds.width / 2
            purpleCircleView.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var greenCircleView: UIView!{
        didSet{
            greenCircleView.backgroundColor = .personalGreen
            greenCircleView.layer.cornerRadius = greenCircleView.bounds.width / 2
            greenCircleView.clipsToBounds = true
        }
    }
    
//    @IBOutlet var blurBackgroundView: UIVisualEffectView!{
//        didSet {
//            blurBackgroundView.effect = UIBlurEffect(style: .regular)
//        }
//    }
    
    
    var proyectsContent: [Proyect] = [
        Proyect(title: "Yako Planet App", date: "09-09-09", progress: 0.25),
        Proyect(title: "Yako Design", date: "10-10-10", progress: 0.50),
        Proyect(title: "Yako Extra App", date: "11-11-11", progress: 0.75),
        Proyect(title: "Yako Extra", date: "12-12-12", progress: 0.90)
    ]
    
    var tasksContent: [Task] = [
        Task(hour: "1 hora", title: "Crear interfaz de usuario en tu Storyboard"),
        Task(hour: "2 horas", title: "Conectar la vista de la celda y la vista del controlador"),
        Task(hour: "3 horas", title: "Crear interfaz de usuario en tu Storyboard"),
        Task(hour: "4 horas", title: "Conectar la vista de la celda y la vista del controlador")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .personalBackgound
        
        setupCustomCollectionCell()
        setupCustomTableCell()
        
        proyectCollectionView.delegate = self
        proyectCollectionView.dataSource = self
        taskTableView.delegate = self
        taskTableView.dataSource = self
        
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
        
        let currentPry = proyectsContent[indexPath.row]
        cell.titleProyect?.text = currentPry.title
        cell.dateProyect?.text = currentPry.date
       
        print("Progress Value for Cell \(indexPath.row): \(currentPry.progress)")

        let progressValue = min(1.0, max(0.0, currentPry.progress))
        cell.progressProyect.progress = Float(currentPry.progress)
        cell.progressColor(progressValue: progressValue)
        cell.updateProgressLabel()

        return cell
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! MyTableViewCell
        
        let currentTask = tasksContent[indexPath.row]
        cell.timeTakeLabel.text = currentTask.hour
        cell.activityLabel?.text = currentTask.title
        
        return cell
    }
    
    
}
