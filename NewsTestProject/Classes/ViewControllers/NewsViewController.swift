//
//  NewsViewController.swift
//  NYNewsApp
//
//  Created by Manpreet Kaur on 19/06/19.
//  Copyright © 2019 Manpreet Kaur. All rights reserved.
//
import UIKit

let kEstimatedNewsRableRowHeight:CGFloat = 100.0

class NewsViewController: UIViewController {

    @IBOutlet weak var articleTableView:UITableView!
    @IBOutlet weak var activityIndicator:UIActivityIndicatorView!

    var dataSource = NewsDataSource()
        
    lazy var viewModel : ArticleViewModel = {
        let viewModel = ArticleViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.0/255.0, green: 255/255.0, blue: 191/255.0, alpha: 1.0)
        UINavigationBar.appearance().barTintColor = UIColor.white //UIColor(red: 0.0/255.0, green: 255/255.0, blue: 191/255.0, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.white
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        
//        let button1 = UIBarButtonItem(image: UIImage(named: "imagename"), style: .plain, target: self, action: Selector("action")) // action:#selector(Class.MethodName) for swift 3
//        self.navigationItem.rightBarButtonItem  = button1
        
        let logoutBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu_round_icon.png"),style: .done, target: self, action: #selector(logoutUser))
       
        logoutBarButtonItem.tintColor = .white

        self.navigationItem.leftBarButtonItem  = logoutBarButtonItem
        
        let loginBarButtonItem = UIBarButtonItem(image: UIImage(named: "search.png"),style: .done, target: self, action: #selector(logoutUser))
         loginBarButtonItem.tintColor = .white
        let bulletBarButtonItem = UIBarButtonItem(image: UIImage(named: "bullet.png"),style: .done, target: self, action: #selector(logoutUser))
         bulletBarButtonItem.tintColor = .white
        self.navigationItem.rightBarButtonItems  = [bulletBarButtonItem,loginBarButtonItem]
        let navigationController = UINavigationController() //not how you should actually get it, but just for purpose of example
        navigationController.navigationBar.tintColor = UIColor.white
        // Do any additional setup after loading the view, typically from a nib.
        setUpIntials()
    }
    
    @objc func logoutUser(){
        print("clicked")
    }
    //MARK:- UI setu methods
    
    func setUpIntials() {
        
        //Setup UI
        self.title = kNewsTitleString
        self.activityIndicator.stopAnimating()

        self.articleTableView.rowHeight = UITableView.automaticDimension
        self.articleTableView.estimatedRowHeight = kEstimatedNewsRableRowHeight

        //Setup datasource
        self.articleTableView.dataSource = self.dataSource
        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.articleTableView.reloadData()
        }
        
        // Fetch article if network available
        Utils.isConnectedToNetwork() ? fetchArticle() : showAlertWithMessgae(message: kNoNetworkErrorMessgae)
    }
    
    func fetchArticle()
    {
        self.activityIndicator.startAnimating()
        self.viewModel.fetchArticles({[weak self] result in
            
            self?.activityIndicator.stopAnimating()
            
            switch result{
                case .failure(let error):
                    self?.showAlertWithMessgae(message: error.localizedDescription)
                
                default:
                    NSLog("sucess")
            }
        })
    }
    
    //MARK:- Alert
    func showAlertWithMessgae(message:String) {
        
        let alertView = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: .alert)
        let action = UIAlertAction(title: kOkButtonTitle, style: .default, handler: nil)
        alertView.addAction(action)
        self.present(alertView, animated: true, completion: nil)
    }
}

//MARK:- Extension for TableViewDelegate handling
extension NewsViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: kNewDetailSegue, sender:
            self.dataSource.data.value[indexPath.row])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kNewDetailSegue {
            let newsDetailVC = segue.destination as? NewsDetailUIViewController
            newsDetailVC?.detailNews = (sender as! ArticleCellViewModel).captionInfo
            newsDetailVC?.detailNewsImageUrl = (sender as! ArticleCellViewModel).imageUrl

        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1.0
    }
}

