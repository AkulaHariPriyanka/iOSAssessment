//
//  ArticleDetailViewController.swift
//  STC-iOSAssessment
//
//  Created by Hari Priyanka on 26/02/19.
//  Copyright © 2019 Accenture. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var articleImgView: UIImageView!
    
    var model: ArticleDetailViewModelDelegate!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.titleLabel.text = model.selectedArticle?.title
        self.descLabel.text = model.selectedArticle?.content
        if let urlString = model.selectedArticle?.imageUrl {
            if let url = URL(string: urlString) {
                if let imageData = NSData(contentsOf: url) as Data? {
                    self.articleImgView.image = UIImage(data: imageData)
                }
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
