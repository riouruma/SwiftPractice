//
//  APIClient.swift
//  QiitaAPISample
//
//  Created by macneko_ayu on 2016/02/20.
//  Copyright © 2016年 macneko.leno. All rights reserved.
//

import Alamofire
import SwiftyJSON

class APIClient {
    var items: [[String: String?]]?  {
        didSet {
            NSNotificationCenter.defaultCenter()
                .postNotificationName("ChangedItemsValue", object: nil, userInfo: nil)
        }
    }

    func getAllUserItems() {
        let urlString: String = "https://qiita.com/api/v2/items"

        Alamofire.request(.GET, urlString)
            .responseJSON { response in
                switch response.result {
                case .Success(let value):
                    let json = JSON(value)
                    var items: [[String: String?]] = []
                    json.forEach { (_, json) in
                        let item: [String: String?] = [
                            "title": json["title"].string,
                            "userId": json["user"]["id"].string
                        ]
                        items.append(item)
                    }
                    self.items = items
                    print(self.items)
                case .Failure(let error):
                    print(error)
                }
        }
    }
}