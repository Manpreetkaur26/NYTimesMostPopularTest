//
//  NewsDetailUIViewController.swift
//  NYNewsApp
//
//  Created by Manpreet Kaur on 19/06/19.
//  Copyright © 2019 Manpreet Kaur. All rights reserved.
//
import UIKit
import SDWebImage

class NewsDetailUIViewController: UIViewController {

    @IBOutlet weak var detailLabel:UILabel!
    @IBOutlet weak var articleDetailIcon:UIImageView!

    var detailNews:String?
    var detailNewsImageUrl:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.0/255.0, green: 255/255.0, blue: 191/255.0, alpha: 1.0)
        UINavigationBar.appearance().barTintColor = UIColor.white //UIColor(red: 0.0/255.0, green: 255/255.0, blue: 191/255.0, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.white

        //self.title = "    "

        // Do any additional setup after loading the view.
        detailLabel.text = detailNews
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadArticleImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        articleDetailIcon.image = nil
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func loadArticleImage() {
        if let urlStr = detailNewsImageUrl {
            let url = URL(string: urlStr)
            //Image Cache using SDWebImage
            articleDetailIcon.sd_setShowActivityIndicatorView(true)
            articleDetailIcon.sd_setIndicatorStyle(.gray)
            articleDetailIcon.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "placeHolder.png"), options: SDWebImageOptions.delayPlaceholder, completed: nil)
        }
    }

}
