//
//  Favorites.swift
//  Lab4
//
//  Created by Labuser on 10/16/16.
//  Copyright © 2016 wustl. All rights reserved.
//

import UIKit

class Favorites: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
   // @IBOutlet weak var searchBar: UISearchBar!
   // @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!

    @IBOutlet weak var tableView: UITableView!

   
    @IBOutlet weak var sortButton: UIButton!
    
    
    var isStart = true
    
   struct GlobalVariables {
        static var data:[String] = []
    }
    
    var searchActive = false;

    
    override func viewDidLoad() {
        if isStart{
            isStart = false
            self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
            loadPlaces()
        }
        
        super.viewDidLoad()
        
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        //self.tableView.reloadData()
        savePlaces()
        
       /* if(Favorites.GlobalVariables.data.isEmpty){
            print("Favorites is empty")
            let alertController = UIAlertController(title: "There is no data in here", message: "Go back and favorite some movies!", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }*/

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true
        print("Begin - searchIsActive: \(searchActive)")
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false
        print("End edit - searchIsActive: \(searchActive)")
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false
        print("Cancel clicked - searchIsActive: \(searchActive)")
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false
        print("Search clicked - searchIsActive: \(searchActive)")
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        filtered = Favorites.GlobalVariables.data.filter({(text) -> Bool in
            return text.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch) != nil
        })
        searchActive = filtered.count != 0
        self.tableView.reloadData()
    }*/
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func savePlaces(){
        let placesArray = Favorites.GlobalVariables.data
        let placesData = NSKeyedArchiver.archivedDataWithRootObject(placesArray)
        NSUserDefaults.standardUserDefaults().setObject(placesData, forKey: "places")
    }
    
    func loadPlaces(){
        let placesData = NSUserDefaults.standardUserDefaults().objectForKey("places") as? NSData
        
        if let placesData = placesData {
            let placesArray = NSKeyedUnarchiver.unarchiveObjectWithData(placesData) as? [String]
            
            if let placesArray = placesArray {
                Favorites.GlobalVariables.data = placesArray
            }
            
        }
    }
    
    @IBAction func sortNow(sender: AnyObject) {
            print("Button on")
            Favorites.GlobalVariables.data.sortInPlace()
            self.tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        savePlaces()
        super.viewDidAppear(animated)
        
        
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = Favorites.GlobalVariables.data.count
        
        if(Favorites.GlobalVariables.data.isEmpty){
            print("Favorites is empty")
            let alertController = UIAlertController(title: "There is no data in here", message: "Go back and favorite some movies!", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        return count
        
    }
    
   
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("Entering adding cells")
        for fav in Favorites.GlobalVariables.data{
            print(fav)
        }
        
        savePlaces()
        
        let cell = tableView.dequeueReusableCellWithIdentifier("movie")! as UITableViewCell
        cell.textLabel?.text = Favorites.GlobalVariables.data[indexPath.row]
        //self.tableView.reloadData()
        
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        savePlaces()
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            Favorites.GlobalVariables.data.removeAtIndex(indexPath.row)
            self.tableView.reloadData()
        }
    }
}
