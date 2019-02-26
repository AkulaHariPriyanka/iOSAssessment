//
//  ArticleDetailViewModel.swift
//  STC-iOSAssessment
//
//  Created by Hari Priyanka on 26/02/19.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation
protocol ArticleDetailViewModelDelegate {
    var selectedArticle: ArticleModel?  { get }
    func setSelectedArticle (article : ArticleModel)
}

class ArticleDetailViewModel : ArticleDetailViewModelDelegate {
    
    var selectedArticle: ArticleModel?
    
    
    func setSelectedArticle (article : ArticleModel) {
        selectedArticle = article
    }
    
}
