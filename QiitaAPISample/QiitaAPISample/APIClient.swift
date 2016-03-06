//
//  APIClient.swift
//  QiitaAPISample
//
//  Created by macneko_ayu on 2016/02/20.
//  Copyright © 2016年 macneko.leno. All rights reserved.
//

import Alamofire
import ObjectMapper

class APIClient {

    func getAllItems(success: (([Item]) -> Void)) {
        let urlString: String = "https://qiita.com/api/v2/items"

        Alamofire.request(.GET, urlString)
            .responseJSON { response in
                switch response.result {
                case .Success(let value):
                    if let items = value as? NSArray {
                        var resultItems: [Item] = []
                        for item in items {
                            if item as? NSDictionary != nil {
                                resultItems.append(Mapper<Item>().map(item)!)
                            }
                        }
                        success(resultItems)
                    }

                case .Failure(let error):
                    print(error)
                }
        }
    }
}