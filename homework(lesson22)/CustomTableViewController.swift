//
//  CustomTableViewController.swift
//  homework(lesson22)
//
//  Created by pavel on 8/16/20.
//  Copyright © 2020 pavel. All rights reserved.
//

import UIKit

class CustomTableViewController: UIViewController {
    
    @IBOutlet weak var customTableView: UITableView!
    
    let id = "cell"
    let colors = [UIColor.red, UIColor.yellow, UIColor.green]
    let nameColors = ["Red", "Yellow", "Green"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customTableView.delegate = self
        customTableView.dataSource = self
        customTableView.register(UINib(nibName: "CustomTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: id)
    }
    


}

extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = customTableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        guard let customCell = cell as? CustomTableViewCell else {
            return cell
        }
        
        switch indexPath.row {
        case 0:
            customCell.customButton.backgroundColor = colors[indexPath.row]
            customCell.customButton.setTitle(nameColors[indexPath.row], for: .normal)
        case 1:
            customCell.customButton.backgroundColor = colors[indexPath.row]
            customCell.customButton.setTitle(nameColors[indexPath.row], for: .normal)
        case 2:
            customCell.customButton.backgroundColor = colors[indexPath.row]
            customCell.customButton.setTitle(nameColors[indexPath.row], for: .normal)
        default:
            break
        }
        
        customCell.backgroundColor = .clear
        customCell.customButton.setTitleColor(.black, for: .normal)
        customCell.customButton.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        
        return customCell
    }
    
    
    @objc func clickButton(sender: UIButton) {
        if sender.backgroundColor == .red {
            view.backgroundColor = .red
            customTableView.backgroundColor = .clear
        } else if sender.backgroundColor == .yellow {
            view.backgroundColor = .yellow
            customTableView.backgroundColor = .clear
        } else if sender.backgroundColor == .green {
            view.backgroundColor = .green
            customTableView.backgroundColor = .clear
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height / 10
    }
    
    
}
