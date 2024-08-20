//
//  PhotoDetailViewController.swift
//  FlickrClientApp
//
//  Created by Sueda Beyza Özcan on 20.08.2024.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var ownerImageView: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Photo Detail"
        imageView.backgroundColor = .gray
        ownerImageView.backgroundColor = .darkGray
        ownerName.text = "Owner Name"
        descriptionLabel.text = "Description Label Description Label Description Label Description Label Description Label Description Label Description Label Description Label Description Label Description Label"
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
