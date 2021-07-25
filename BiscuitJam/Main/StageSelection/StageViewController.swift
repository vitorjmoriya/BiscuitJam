//
//  StageCollectionViewController.swift
//  BiscuitJam
//
//  Created by Paulo Bassani on 23/07/21.
//

import UIKit

var images = [#imageLiteral(resourceName: "Stage1"), #imageLiteral(resourceName: "Stage2"), #imageLiteral(resourceName: "Stage3")]

class StageCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        
    }

}

extension StageCollectionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return images.count
    }
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StageCollectionViewCell", for: indexPath) as! StageCollectionViewCell
        cell.stageButton.setImage(images[indexPath.item], for: .normal)
        cell.lock.alpha = 0
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        vc.selectedStage = indexPath.item
        show(vc, sender: self)
    }
}
