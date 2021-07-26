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
    
    @IBAction func goBackMenu(unwindSegue: UIStoryboardSegue) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        
    }

}

extension StageCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
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
        cell.stageImage.image = images[indexPath.item]
        cell.lock.isHidden = true
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let gameStoryboard = UIStoryboard(name: "GameStoryboard", bundle: nil)
        let vc = gameStoryboard.instantiateViewController(identifier: "GameViewController") as! GameViewController
        vc.selectedStage = indexPath.item
        print(indexPath.item)
        show(vc, sender: self)
    }
}
