//
//  MainViewController.swift
//  BiscuitJam
//
//  Created by Paulo Bassani on 21/07/21.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        AudioManager.shared.playMusic(name: "The Curious Kitten - Aaron Kenny" , musicExtension: "mp3")
        // Do any additional setup after loading the view.
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
