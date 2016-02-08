//
//  ChooseMassViewController.swift
//  TechPizza
//
//  Created by Usuario on 07-02-16.
//  Copyright © 2016 techCourse. All rights reserved.
//

import UIKit

class ChooseMassViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var pizza : Pizza?
    let massTypes = ["delgada", "crugiente", "gruesa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.massTypes.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        let identifier = "Mass"
        cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        cell!.textLabel?.text = self.massTypes[indexPath.row]
        cell!.textLabel?.textColor = UIColor.whiteColor()
        
        return cell!
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.pizza?.mass = self.massTypes[indexPath.row];
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        self.pizza?.mass = nil
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(self.pizza?.mass == nil) {
            let alert : UIAlertController = UIAlertController(title: "Error", message: "Por Favor, Seleccione una opcion", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        let destinationController = segue.destinationViewController as! ChooseCheeseViewController
        destinationController.pizza = self.pizza
    }

}