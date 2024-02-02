//
//  ActivityTVC.swift
//  Level Assessment
//
//  Created by Jon Snow on 02/02/24.
//

import UIKit
struct DetailData : Codable{
    var image : String
    var Name : String
    var Subtitle : String
}


class ActivityTVC: UITableViewCell {
    let ActivityArray : [DetailData] =
    [
        DetailData(image: "Gratitude", Name: "Gratitude", Subtitle: "Journal"),
        DetailData(image: "Gratitude2", Name: "For Inner Peace", Subtitle: "Music")
    ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "DispCVC", bundle: .main), forCellWithReuseIdentifier: "DispCVC")
        collectionView.dataSource = self
        collectionView.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

extension ActivityTVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ActivityArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DispCVC", for: indexPath) as! DispCVC
        cell.ImageBack.image = UIImage(named: ActivityArray[indexPath.row].image)
        cell.HeadLabel.text = ActivityArray[indexPath.item].Name
        cell.LabelDesc.text = ActivityArray[indexPath.item].Subtitle
        
        return cell
    }
}

extension ActivityTVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((collectionView.frame.width - 20)/1)
        let height = width / 2.3
        return CGSize(width: width, height: height)
    }
}
