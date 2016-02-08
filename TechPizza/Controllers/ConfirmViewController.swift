//
//  ConfirmViewController.swift
//  TechPizza
//
//  Created by Usuario on 08-02-16.
//  Copyright © 2016 techCourse. All rights reserved.
//

import UIKit

class ConfirmViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var pizza : Pizza?
    
    @IBOutlet weak var size: UILabel!
    @IBOutlet weak var mass: UILabel!
    @IBOutlet weak var cheese: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        self.size.text = self.pizza?.size
        self.mass.text = self.pizza?.mass
        self.cheese.text = self.pizza?.cheese
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pizza!.ingredients.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        let identifier = "Detail"
        cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        cell!.textLabel?.text = self.pizza?.ingredients[indexPath.row]
        cell!.textLabel?.textColor = UIColor.whiteColor()
        
        return cell!
    }
    
    @IBAction func confirm(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
        let alert : UIAlertController = UIAlertController(title: nil, message: "Su pizza esta siendo preparada", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
