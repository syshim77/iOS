//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Shim Sooyeon on 2017. 10. 1..
//  Copyright © 2017년 Shim Sooyeon. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    var itemStore: ItemStore!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 재사용 셀이나 새로운 셀을 얻는다
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        // 물품 배열의 n번째에 있는 항목의 설명을 n과 row와 일치하는 셀의 텍스트로 설정한다
        // 이 셀은 테이블 뷰의 n번째 행에 나타난다
        let item = itemStore.allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 상태 바의 높이를 얻는다
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
}
