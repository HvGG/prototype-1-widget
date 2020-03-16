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
import LetterAvatarKit

class GagernTodayViewControllerTableController: UITableViewController, NCWidgetProviding {

    var homework = ["S. 36f. 5a-j 7g-l 8", "Experiment AB3", "Resümee (vgl. AB1)", "S. 158 4-6", "Comparative Essay"]
    var subj = ["Mathe", "Physik", "Deutsch", "Französisch", "PoWi"]
    
    var stati = ["Erledigt", "Ausstehend"]
    var statiIcons = ["checklist.seal", "clock"]
    
    var subjects = [
    "Mathe": "M",
    "Physik": "PH",
    "Deutsch": "D",
    "Latein": "L",
    "Biologie": "B",
    "Informatik": "INF",
    "Chemie": "CH",
    "Musik": "MU",
    "Griechisch": "GR",
    "Geschichte": "G",
    "PoWi": "PW",
    "Italienisch": "I",
    "Französisch": "F",
    "Philosophie": "P",
    "AG": "AG",
    ]
    
    func randomIntFrom(start: Int, to end: Int) -> Int {
        var a = start
        var b = end
        // swap to prevent negative integer crashes
        if a > b {
            swap(&a, &b)
        }
        return Int(arc4random_uniform(UInt32(b - a + 1))) + a
    }
    
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
            preferredContentSize = CGSize(width: maxSize.width, height: CGFloat(homework.count * 110))
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0;//Choose your custom row height
    }
    
    
    // MARK: - Table view cell creation
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "homeworkCell", for: indexPath) Not really required because we only have up to 10 entries.

        
        let cell = UITableViewCell();
        //cell.textLabel?.text = homework[indexPath.row]
        
        print(cell.frame.size.height)
        

        //cell.textLabel?.removeFromSuperview()
            
        //cell.subviews.forEach({ $0.removeFromSuperview() })
        
        let avatar = LetterAvatarMaker()
            .setCircle(true)
            .setUsername(subj[indexPath.row])
            .setBackgroundColors([.gray])
            .setSize(CGSize(width: 50, height: 50))
            .build()
        //let bA = (cell.frame.size.height - ((avatar?.size.height)!)) / 2
        var ava = UIImageView(image: avatar?.imageWithInset(insets: UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 15.0)))
        
        
        let title = PaddingLabel()
        title.text = homework[indexPath.row]
        title.leftInset = 5.0
        title.bottomInset = 5.0
        title.topInset = 0
        title.font = UIFont.boldSystemFont(ofSize: 20)
        
        let conf = UIImage.SymbolConfiguration(scale: .default)
        let img = UIImage(systemName: "calendar", withConfiguration: conf)
        
        // MARK: Calendar / Date
        
        let cal = UIImageView(image: img?.withTintColor(.white, renderingMode: .alwaysOriginal).imageWithInsets(insetDimen: 5.0))
        cal.layoutMargins = UIEdgeInsets.init(top: 0, left: 0, bottom: 25.0, right: 0)
        
        let date = PaddingLabel()
        date.text = "23.07.2021"
        date.rightInset = 5.0
        date.topInset = 0
        date.bottomInset = 5.0
        
        let dateS = UIStackView()
        dateS.axis = .horizontal
        
        
        let s = randomIntFrom(start: 0, to: stati.count - 1)
        let dImg = UIImage(systemName: statiIcons[s], withConfiguration: conf)
        
        // MARK: Status
        
        let status = UIImageView(image: dImg?.withTintColor(.white, renderingMode: .alwaysOriginal))
        cal.layoutMargins = UIEdgeInsets.init(top: 0, left: 0, bottom: 25.0, right: 0)
        
        if s == 0 {
            let suc = UIImage(systemName: statiIcons[s], withConfiguration: UIImage.SymbolConfiguration(scale: .large))
            ava = UIImageView(image: suc?.withTintColor(.green, renderingMode: .alwaysOriginal).imageWithInset(insets: UIEdgeInsets.init(top: 0, left: 0, bottom: 5.0, right: 5.0)))
        }
        
        ava.layoutMargins = UIEdgeInsets.init(top: 0, left: 0, bottom: 10.0, right: 10.0)
        
        let stat = PaddingLabel()
        date.text = stati[s]
        date.rightInset = 5.0
        date.topInset = 0
        date.bottomInset = 5.0
        
        let statusS = UIStackView()
        dateS.axis = .horizontal
        
        
        let data = UIStackView()
        data.axis = .vertical
        data.alignment = .leading
        data.distribution = .fill
        
        let sw = UIStackView()
        sw.axis = .horizontal
        sw.alignment = .center
        sw.distribution = .fill
        
        
        sw.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        cell.addSubview(sw)
        
        sw.addArrangedSubview(data)
        data.addArrangedSubview(title)
        data.addArrangedSubview(dateS)
        //data.addArrangedSubview(statusS)
        dateS.addArrangedSubview(cal)
        dateS.addArrangedSubview(date)
        statusS.addArrangedSubview(status)
        statusS.addArrangedSubview(stat)
        sw.addArrangedSubview(ava)
        
        sw.translatesAutoresizingMaskIntoConstraints = false
        cell.addConstraint(NSLayoutConstraint(item: sw, attribute: .top, relatedBy: .equal, toItem: cell, attribute: .top, multiplier: 1.0, constant: 25.0))
        cell.addConstraint(NSLayoutConstraint(item: sw, attribute: .leading, relatedBy: .equal, toItem: cell, attribute: .leading, multiplier: 1.0, constant: 0.0))
        cell.addConstraint(NSLayoutConstraint(item: sw, attribute: .trailing, relatedBy: .equal, toItem: cell, attribute: .trailing, multiplier: 1.0, constant: 0.0))
        
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
