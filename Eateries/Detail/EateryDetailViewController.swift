//
//  EateryDetailViewController.swift
//  Eateries
//
//  Created by Елена Позднякова on 07.06.2018.
//  Copyright © 2018 swiftbook. All rights reserved.
//

import UIKit

class EateryDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var rateButton: UIButton!
    var restaurant: Restaurant?

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //высота ячейки
        tableView.estimatedRowHeight = 38
        tableView.rowHeight = UITableViewAutomaticDimension
        
        rateButton.layer.cornerRadius = 5
        rateButton.layer.borderWidth = 1
        rateButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        imageView.image = UIImage(named: restaurant!.image)
        //цвет таблицы и разделителя
//        tableView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
//        tableView.separatorColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        //убираем неиспользуемую нижнюю часть талицы
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        //отображение в заголовке navigationBar названия ресторана
        title = restaurant!.name
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension EateryDetailViewController: UITableViewDataSource, UITableViewDelegate {
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EateryDetailTableViewCell
        switch indexPath.row {
        case 0:
            cell.keyLabel.text = "Название"
            cell.valueLabel.text = restaurant!.name
        case 1:
            cell.keyLabel.text = "Тип"
            cell.valueLabel.text = restaurant!.type
        case 2:
            cell.keyLabel.text = "Адрес"
            cell.valueLabel.text = restaurant!.location
        case 3:
            cell.keyLabel.text = "Я там был"
            cell.valueLabel.text = restaurant!.isVisited ? "Да" : "Нет"
        default:
            break
        }
        //cell.backgroundColor = UIColor.clear //чтобы цвет таблицы был однородным
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
