//
//  RainbowViewController.swift
//  homework(lesson22)
//
//  Created by pavel on 8/8/20.
//  Copyright © 2020 pavel. All rights reserved.
//
//2. Разноцветные ячейки в таблице. В каждой ячейке - кнопка. Нажатие на кнопку перекрашивает контроллер в цвет ячейки



import UIKit

class RainbowViewController: ViewController {

    private var tableView = UITableView()
    private let identifier = "cell"
    private let colorArray = ["Red",
                              "Orange",
                              "Yellow",
                              "Green",
                              "Blue",
                              "Indigo",
                              "Violet"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showTableView()
        
    }
    

    //MARK: - create TableView
    private func showTableView() {
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        view.addSubview(tableView)
    }
    
}


extension RainbowViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: - count cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorArray.count
    }
    
    //MARK: - create cell with another color
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let color = colorArray[indexPath.row]    // text cell
        cell.textLabel?.text = color
        cell.accessoryType = .detailButton        // create button
        cell.tintColor = .black                 // color button black

    switch indexPath.row {                     // color cell
                   case 0:
                    cell.backgroundColor = .systemRed
                   case 1:
                    cell.backgroundColor = .systemOrange
                   case 2:
                    cell.backgroundColor = .systemYellow
                   case 3:
                    cell.backgroundColor = .systemGreen
                   case 4:
                    cell.backgroundColor = .systemIndigo
                   case 5:
                    cell.backgroundColor = .systemBlue
                   case 6:
                    cell.backgroundColor = .systemPurple
                   default:
                       break
                   }
        
            return cell
        }
        
    
    //MARK: - change color cell and text "Richard Of York Gave Battle In Vain"
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let clickCell = tableView.cellForRow(at: indexPath)
        
        switch indexPath.row {
            case 0:
                clickCell?.backgroundColor = .clear
                clickCell?.textLabel?.text = "Richard"
                view.backgroundColor = .systemRed
                tableView.backgroundColor = .clear
            case 1:
                clickCell?.backgroundColor = .clear
                clickCell?.textLabel?.text = "Of"
                view.backgroundColor = .systemOrange
                tableView.backgroundColor = .clear
            case 2:
                clickCell?.backgroundColor = .clear
                clickCell?.textLabel?.text = "Yourk"
                view.backgroundColor = .systemYellow
                tableView.backgroundColor = .clear
            case 3:
                clickCell?.backgroundColor = .clear
                clickCell?.textLabel?.text = "Gave"
                view.backgroundColor = .systemGreen
                tableView.backgroundColor = .clear
            case 4:
                clickCell?.backgroundColor = .clear
                clickCell?.textLabel?.text = "Battle"
                view.backgroundColor = .systemIndigo
                tableView.backgroundColor = .clear
            case 5:
                clickCell?.backgroundColor = .clear
                clickCell?.textLabel?.text = "In"
                view.backgroundColor = .systemBlue
                tableView.backgroundColor = .clear
            case 6:
                clickCell?.backgroundColor = .clear
                clickCell?.textLabel?.text = "Vain"
                view.backgroundColor = .systemPurple
                tableView.backgroundColor = .clear
            default:
                break
            }
        }
    
    
    //MARK: - height cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height / 14
    }
}
