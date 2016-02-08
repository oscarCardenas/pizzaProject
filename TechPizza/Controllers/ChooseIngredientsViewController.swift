//
//  ChooseIngredientsViewController.swift
//  TechPizza
//
//  Created by Usuario on 07-02-16.
//  Copyright © 2016 techCourse. All rights reserved.
//

import UIKit

class ChooseIngredientsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var pizza : Pizza?
    let ingredients = ["jamón", "pepperoni", "pavo", "salchicha", "aceituna", "cebolla", "pimiento", "piña", "anchoa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell:UITableViewCell?
        let identifier = "Ingredient"
        cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        cell!.textLabel?.text = self.ingredients[indexPath.row]
        cell!.selected ? (cell!.accessoryType = .Checkmark) : (cell!.accessoryType = .None)
        cell!.textLabel?.textColor = UIColor.whiteColor()        
        
        return cell!
    }

    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if(self.pizza?.ingredients.count >= 5) {
            let alert : UIAlertController = UIAlertController(title: "Error", message: "Puede seleccionar maximo cinco ingredientes", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return nil
        }
        
        return indexPath
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)

        if cell != nil && cell!.selected{
            cell!.accessoryType = .Checkmark
        }
        
        self.pizza?.ingredients.append(self.ingredients[indexPath.row])
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let index = self.pizza?.ingredients.indexOf(self.ingredients[indexPath.row])
        self.pizza?.ingredients.removeAtIndex(index!)
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            cell.accessoryType = .None
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(self.pizza?.ingredients.count == 0) {
            let alert : UIAlertController = UIAlertController(title: "Error", message: "Por Favor, Seleccione al menos una opcion", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        
        let destinationController = segue.destinationViewController as! ConfirmViewController
        destinationController.pizza = self.pizza
        
    }

}