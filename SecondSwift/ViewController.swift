//
//  ViewController.swift
//  SecondSwift
//
//  Created by Alessio Roberto on 12/06/14.
//  Copyright (c) 2014 Alessio Roberto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ExpandDelegate  {
    
    @IBOutlet var myTableView : UITableView?
    
    var objects = ["a", "b", "c", "d", "f", "g"]
    
    var expandedCellAtIndex : NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.myTableView?.registerClass(NormalTableViewCell.self, forCellReuseIdentifier: "NormalCell")
        
        self.myTableView?.registerClass(ExpandTableViewCell.self, forCellReuseIdentifier: "ExpandCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!,
        numberOfRowsInSection section: Int) -> Int{
        return objects.count
    }

    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        if indexPath.row == expandedCellAtIndex?.row {
            println("\(indexPath)")
            return 100.0
        }
        return 44.0

    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        if indexPath == expandedCellAtIndex? {
            let cell:ExpandTableViewCell = tableView.dequeueReusableCellWithIdentifier("ExpandCell", forIndexPath: indexPath) as ExpandTableViewCell
            
            cell.delegate = self
            
            cell.tagNameLabel.text = "Rate Target"
            
            cell.buttonPressed = {msg in
                println("Message [\(msg)]")
            }
            return cell
        } else {
            let cell:NormalTableViewCell = tableView.dequeueReusableCellWithIdentifier("NormalCell", forIndexPath: indexPath) as NormalTableViewCell
            
            cell.tagNameLabel.text = objects[indexPath.row]
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        if indexPath.row != expandedCellAtIndex?.row {
            if let tmp = expandedCellAtIndex? {
                tableView.reloadRowsAtIndexPaths([tmp], withRowAnimation: UITableViewRowAnimation.Automatic)
            }
            expandedCellAtIndex = indexPath
        } else if indexPath.row == expandedCellAtIndex?.row {
            expandedCellAtIndex = nil
        } else if expandedCellAtIndex == nil {
            expandedCellAtIndex = indexPath
        }
        tableView.reloadData()
    }
    // MARK: ExpandDelegate
    
    func buttonPressed(action: String) -> () {
        println("\(action)")
    }
}

