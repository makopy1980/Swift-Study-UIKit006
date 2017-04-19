//
//  ViewController.swift
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Private Fields
    
    private let items = ["TEST1", "TEST2", "TEST3"]
    private var _tableView: UITableView!

    // MARK: - View Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Viewの設定
        self.setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        // TableViewの設定
        self.setupTableView()
    }
    
    /// TableViewの設定
    private func setupTableView() {
        // ステータスバーの高さを取得
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        // 画面サイズの取得
        let displaySize = CGSize(width: self.view.frame.width,
                                 height: self.view.frame.height)

        let tableViewSize = displaySize
        let tableViewPoint = CGPoint(x: 0.0,
                                     y: statusBarHeight)

        _tableView = UITableView(frame: CGRect(origin: tableViewPoint,
                                               size: tableViewSize),
                                 style: .plain)
        
        // Cell名の登録
        _tableView.register(UITableViewCell.self,
                            forCellReuseIdentifier: "Cell")

        _tableView.dataSource = self
        _tableView.delegate = self

        self.view.addSubview(_tableView)
    }
    
    // MARK: - UITableViewDataSource & UITableViewDelegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cellの再利用
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                 for: indexPath as IndexPath)
        
        cell.textLabel!.text = "\(items[indexPath.row])"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(items[indexPath.row])")
    }
}

