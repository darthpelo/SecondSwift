//
//  ViewController.swift
//  SecondSwift
//
//  Created by Alessio Roberto on 12/06/14.
//  Copyright (c) 2014 Alessio Roberto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet var myTableView : UITableView
    
    var objects : String[] = ["a", "b", "c", "d", "f", "g"]
    
    var expandedCellAtIndex : NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.myTableView.registerClass(NormalTableViewCell.self, forCellReuseIdentifier: "NormalCell")
        
        self.myTableView.registerClass(ExpandTableViewCell.self, forCellReuseIdentifier: "ExpandCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> Float {
        if indexPath.row == expandedCellAtIndex?.row {
            println("\(indexPath)")
            return 100.0
        }
        return 44.0
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        if indexPath == expandedCellAtIndex {
            let cell:ExpandTableViewCell = self.myTableView.dequeueReusableCellWithIdentifier("ExpandCell") as ExpandTableViewCell
            
            cell.tagNameLabel.text = "Rate Target"
            return cell
        } else {
            let cell:NormalTableViewCell = self.myTableView.dequeueReusableCellWithIdentifier("NormalCell") as NormalTableViewCell

            cell.tagNameLabel.text = "Tag #\(objects[indexPath.row])"
            return cell
        }
    }

    func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
            return true
    }
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle,
        forRowAtIndexPath indexPath: NSIndexPath!) {
            switch editingStyle {
            case .Delete:
                objects.removeAtIndex(indexPath.row)
            case .Insert, .None:
                println("None")
            }
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        if indexPath.row != expandedCellAtIndex?.row {
            if let tmp = expandedCellAtIndex? {
                tableView.reloadRowsAtIndexPaths([tmp], withRowAnimation: UITableViewRowAnimation.Automatic)
            }
            expandedCellAtIndex = indexPath
//            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        } else if indexPath.row == expandedCellAtIndex?.row {
            expandedCellAtIndex = nil
//            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        } else if expandedCellAtIndex == nil {
            expandedCellAtIndex = indexPath
//            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
        tableView.reloadData()
    }
}

