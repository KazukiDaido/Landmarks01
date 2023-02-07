//
//  SwiftUIView.swift
//  Landmarks
//
//  Created by 大道一輝 on 2023/02/06.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        class ViewController: UIViewController, UITextFieldDelegate {
          @IBOutlet weak var textField: UITextField!
          @IBOutlet weak var tableView: UITableView!
          
          var data = [String]()
          var filteredData = [String]()
          
          override func viewDidLoad() {
            super.viewDidLoad()
            
            // 検索対象データを初期化
            data = ["Apple", "Banana", "Cherry", "Durian"]
            
            textField.delegate = self
          }
          
          func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            // テキストフィールドの値が変更されたら、検索処理を実行する
            let searchText = textField.text! + string
            filteredData = data.filter({$0.prefix(searchText.count) == searchText})
            tableView.reloadData()
            
            return true
          }
        }

        extension ViewController: UITableViewDataSource {
          func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return filteredData.count
          }
          
          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = filteredData[indexPath.row]
            return cell
          }
        }


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
