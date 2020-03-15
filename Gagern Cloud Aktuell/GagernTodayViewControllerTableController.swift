//
//  GagernTodayViewControllerTableController.swift
//  Gagern Cloud Aktuell
//
//  Created by Julian Benedikt Heuschen on 14.03.20.
//  Copyright © 2020 Julian Benedikt Heuschen. All rights reserved.
//

import UIKit
import NotificationCenter
import PaddingLabel

class GagernTodayViewControllerTableController: UITableViewController {

    var homework = ["S. 36f. 5a-j 7g-l 8", "Resümee (vgl. AB1)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Enabling expansion")
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        print("Done.")
        
        

    }

    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        print("Called")
        if activeDisplayMode == .expanded {
            print("Expanded")
            preferredContentSize = CGSize(width: maxSize.width, height: 699)
        } else {
            print("Compact")
            preferredContentSize = maxSize
        }
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return homework.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeworkCell", for: indexPath)

        //cell.textLabel?.text = homework[indexPath.row]

        
        
        print("SMIconLabel")
        /*let iconLabel = SMIconLabel(frame: CGRect(x: 0, y: 0, width: cell.frame.size.width, height: cell.frame.size.height))
        iconLabel.text = homework[indexPath.row]
        iconLabel.icon = UIImage(systemName: "calendar")
        iconLabel.iconPadding = 5
        iconLabel.numberOfLines = 1
        iconLabel.iconPosition = (.left, .top)
        cell.addSubview(iconLabel)*/
        cell.textLabel?.removeFromSuperview()
        
        
        let title = PaddingLabel()
        title.text = homework[indexPath.row]
        title.leftInset = 5.0
        title.bottomInset = 5.0
        title.topInset = 0
        //title.heightAnchor.constraint(equalToConstant: cell.frame.size.height).isActive = true
        //title.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        let conf = UIImage.SymbolConfiguration(scale: .default)
        let img = UIImage(systemName: "calendar", withConfiguration: conf)
        
        let cal = UIImageView(image: img?.withTintColor(.white, renderingMode: .alwaysOriginal))
        
        
        
        //cal.heightAnchor.constraint(equalToConstant: cell.frame.size.height).isActive = true
        //cal.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        let date = PaddingLabel()
        date.text = "23.07.2021"
        date.rightInset = 5.0
        date.topInset = 0
        
        //date.heightAnchor.constraint(equalToConstant: cell.frame.size.height).isActive = true
        //date.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        let sw = UIStackView()
        sw.axis = .horizontal
        sw.alignment = .center
        sw.distribution = .equalSpacing
        
        
        sw.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        cell.addSubview(sw)
        
        sw.addArrangedSubview(title)
        sw.addArrangedSubview(cal)
        sw.addArrangedSubview(date)
        
        sw.translatesAutoresizingMaskIntoConstraints = false
        cell.addConstraint(NSLayoutConstraint(item: sw, attribute: .top, relatedBy: .equal, toItem: cell, attribute: .top, multiplier: 1.0, constant: 25.0))
        cell.addConstraint(NSLayoutConstraint(item: sw, attribute: .leading, relatedBy: .equal, toItem: cell, attribute: .leading, multiplier: 1.0, constant: 0.0))
        cell.addConstraint(NSLayoutConstraint(item: sw, attribute: .trailing, relatedBy: .equal, toItem: cell, attribute: .trailing, multiplier: 1.0, constant: 0.0))
        
        //sw.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
        //sw.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
        
        return cell
    
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
