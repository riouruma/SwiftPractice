//
//  ViewController.swift
//  QiitaAPISample
//
//  Created by macneko_ayu on 2016/02/20.
//  Copyright © 2016年 macneko.leno. All rights reserved.
//

import UIKit

class ArticleListViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var items: [[String : String?]] = []
    let client = APIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "新着記事"
        tableView.dataSource = self

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didFinishedRequest", name: "ChangedItemsValue", object: nil)
        
        client.getAllUserItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func didFinishedRequest() {
        items = client.items!
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        let item = items[indexPath.row]
        cell.textLabel?.text = item["title"]!
        cell.detailTextLabel?.text = item["userId"]!
        return cell
    }
}

