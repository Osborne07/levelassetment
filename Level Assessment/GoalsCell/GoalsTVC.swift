//
//  GoalsTVC.swift
//  Level Assessment
//
//  Created by Jon Snow on 02/02/24.
//

import UIKit
//struct Meditation : Codable{
//    var Days : String
//    var Content : [ContentModel]
//}

struct ContentModel: Codable{
    var image : String
    var Head : String
    var Sub : String
    var Identity : String
}


class GoalsTVC: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let dataArray : [ContentModel] =
    [
        ContentModel(image: "Image1", Head: "Day 1: Steps To Recharge", Sub: "Meditation", Identity: "Coach - Muskan"),
        ContentModel(image: "Image2", Head: "Day 2: Steps To Recharge", Sub: "Meditation", Identity: "Coach - Muskan")
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "GoalsCVC", bundle: .main), forCellWithReuseIdentifier: "GoalsCVC")
         collectionView.dataSource = self
         collectionView.delegate = self
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}


extension GoalsTVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GoalsCVC", for: indexPath) as! GoalsCVC
        
        cell.NameLabel.text = dataArray[indexPath.item].Sub
        cell.CoachLabel.text = dataArray[indexPath.item].Identity
        cell.ImageView.image = UIImage(named: dataArray[indexPath.row].image)
        return cell
        
        
    }
}


extension GoalsTVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 5, left: 10, bottom: 10, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((collectionView.frame.height-20)/1)
        let height = width/1.8
        return CGSize(width: width, height: height)
    }
}
