//
//  ArticlesListViewController.swift
//  STC-iOSAssessment
//
//  Created by Hari Priyanka on 26/02/19.
//  Copyright © 2019 Accenture. All rights reserved.
//

import UIKit

class ArticlesListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private var model: ArticleViewModelDelegate!
    var cache:NSCache<AnyObject, AnyObject>!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        model = ArticleViewModel()
        self.cache = NSCache()

        model.delegate = self
        // Do any additional setup after loading the view.
  
        model.fetchArticleData()
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detailSegue") {
            
            let row = tableView.indexPathForSelectedRow?.row
            if let row = row {
                let detailVC = segue.destination as? ArticleDetailViewController
//                detailVC?.selectedArticle = model?.articles[row]
                detailVC?.model = ArticleDetailViewModel()
            
                detailVC?.model.setSelectedArticle(article: (model?.articles[row])!)
            }
        }
    }

    // MARK: - Table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellIdentifier = "cell"
        let article = model?.articles[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ArticleListCell
        cell?.titleLabel.text = article!.title
        cell?.contentLabel.text = article!.content
        
        /*
         Setting a placeholder image for all the image cells.
         */
        cell?.articleImageView?.image = UIImage(named: "article-placeholder.png")
        
        /*
         Loading the already cached image if exists.
         */
        if (self.cache.object(forKey: (indexPath as NSIndexPath).row as AnyObject) != nil){
            cell?.articleImageView?.image = self.cache.object(forKey: (indexPath as NSIndexPath).row as AnyObject) as? UIImage
        } /*
             Image not available in cache, downloads the images only for visible cells.
             */
        else {
            model?.configureImageCacheCell(cell: cell!, article: article!, tableView: tableView, indexPath: indexPath as NSIndexPath, cache: cache)
        }
        
        return cell!
    }
}
extension ArticlesListViewController: ViewModelDelegate {
        
        func didLoadData() {
            tableView.reloadData()
        }
}


