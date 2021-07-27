//
//  AchievementsViewController.swift
//  BiscuitJam
//
//  Created by Paulo Bassani on 26/07/21.
//

import UIKit

class AchievementsViewController: UIViewController {

    @IBOutlet weak var smoothView: UIView!
    @IBOutlet weak var greedyView: UIView!
    @IBOutlet weak var elderyView: UIView!
    @IBOutlet weak var legendaryView: UIView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = "Achievement description.\n\nStatus: ???"
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let iconViews = [smoothView, greedyView, elderyView, legendaryView]
        for view in iconViews {
            view?.alpha = 1
        }
        if let touch = touches.first {
            touch.view?.alpha = 0.5
            switch touch.view {
            case smoothView:
                descriptionLabel.text = "Survive at least 5s with 10 or more rats on the screen.\n\nStatus: compleated!"
                imageView.image = #imageLiteral(resourceName: "Foto da Borba")
            case greedyView:
                descriptionLabel.text = "Collect all types of power ups in a single game.\n\nStatus: compleated!"
                imageView.image = #imageLiteral(resourceName: "Foto da Branca")
            case elderyView:
                descriptionLabel.text = "Survive at least 60s.\n\nStatus: compleated!"
                imageView.image = #imageLiteral(resourceName: "Foto da Zana")
            case legendaryView:
                descriptionLabel.text = "Compleate all achievements in a single game.\n\nStatus: compleated!"
                imageView.image = #imageLiteral(resourceName: "Foto das Tres")
            default:
                descriptionLabel.text = "Something wrong happened."
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
