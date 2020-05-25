//
//  ViewController.swift
//  SchoolList
//
//  Created by Ahn on 2020/05/24.
//  Copyright © 2020 ozofweird. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var info: [SecondResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let cellNib = UINib(nibName: "TableCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "TableCell")
        
        // 데이터 업데이트
        Alamofire.request("http://54.180.11.181/school.php", method: .get)
            .validate(statusCode: 200..<300)
            .responseObject(completionHandler: {(response: DataResponse<FirstResponse>) in
                switch response.result {
                    
                case .success(let dataResponse):
                    // MARK: - Code, Message 경고창
                    if dataResponse.code != 100 {
                        // 다른 화면 전환 혹은 메세지 경고
                        let alert = UIAlertController(title: "경고", message: dataResponse.message, preferredStyle: UIAlertController.Style.alert)
                        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                            
                        }
                        alert.addAction(okAction)
                        self.present(alert, animated: true, completion: nil)
                    }
                    self.info = dataResponse.result
                    self.tableView.reloadData()

                case .failure(let error):
                    print(error)
                }
            })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }


//    // Alamofire Post Method 사용법
//    func alamofirePostMethod(fromVC vc: ViewController, parm1: String, parm2: String, parm3: String) {
//        let headers: [String: String] = ["Content-Type": "application/json"]
//         let parameters: Parameters = [
//            // API 키 값과 동일하게 설정
//             "parm1": parm1,
//             "parm2": parm2,
//             "parm3": parm3
//         ]
//
//        // headers의 "Content-Type"과 encoding 값이 동일한 형식이여야 함
//        Alamofire.request("\(ServerAPI.ip)", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
//             .validate()
//             .responseObject(completionHandler: { (response: DataResponse<FirstResponse>) in
//                 switch response.result {
//                 case .success(let signUpResponse):
//                     switch signUpResponse.code {
//                     case 100:
//                        print("100 Code 결과에 따른 동작 처리")
//                     case 200:
//                        print("200 Code 결과에 따른 동작 처리")
//                     default:
//                         break
//                     }
//                 case .failure(let error):
//                     print(error)
//                 }
//             })
//    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as? TableCell else {
            return UITableViewCell()
        }
        
        cell.schoolNameLabel.text = self.info[indexPath.row].schoolName

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dvc = DetailController(nibName: "DetailController", bundle: nil)
        dvc.modalPresentationStyle = .fullScreen
        
        dvc.temp = self.info[indexPath.row].studentCount
        
        self.present(dvc, animated: true, completion: nil)
    }
    
}


