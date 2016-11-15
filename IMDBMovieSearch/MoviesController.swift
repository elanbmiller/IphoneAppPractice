//
//  MovieController.swift
//  Lab4
//
//  Created by Labuser on 10/13/16.
//  Copyright © 2016 wustl. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate{
    var searchKeyword : String = ""
    var theData: [Info] = []
    var theImageCache: [UIImage] = []
    
    

    
   // var overlay : UIView?
    //let progressIndicatorView = circleLoader(frame: CGRectZero)
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var Movies: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    
    
    override func viewDidLoad() {
        activityIndicator.hidesWhenStopped = true;
        activityIndicator.activityIndicatorViewStyle  = UIActivityIndicatorViewStyle.Gray;
        activityIndicator.center = view.center;
        
      /*  var activityView = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
        activityView.center = self.view.center
        activityView.startAnimating()
        self.view.addSubview(activityView)*/
        
        
        self.Movies.dataSource = self
        self.searchBar.delegate = self
        self.Movies.delegate = self
        

        
        
        //view.willRemoveSubview(activityView)
        
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED,0)){
            
            
            
            
            self.fetchDataForCollView()
            self.cacheImages()
            
            dispatch_async(dispatch_get_main_queue()){
                
                self.activityIndicator.stopAnimating()
                //activityView.hidden = true
                
                self.Movies.reloadData()
            }
        }
        
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchKeyword = searchBar.text!
        self.viewDidLoad()
    }

    
    func searchBarSearchButtonClicked(searchBar: UISearchBar){
        searchKeyword = searchBar.text!
        

        self.activityIndicator.startAnimating()
        
        
        searchBar.resignFirstResponder()//remove search bar when enter occurs
        self.viewDidLoad()
        
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.theData.count
    }
    
   func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        //print ("in cell for item at row \(indexPath.row) and section \(indexPath.section) ")
    
 
    
    
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("mycell", forIndexPath: indexPath) as! MovieCell
        cell.backgroundColor = UIColor.whiteColor()
        cell.poster.image = theImageCache[indexPath.row]
        cell.tViewTitle.text = theData[indexPath.row].name
        
        return cell
    }
    
//     func collectionView(collectionView: UICollectionView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        //let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        
//        //let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("Detailed.xib") as! Detailed
//        
//        
//        let detailedVC = Detailed(nibName: "Detailed", bundle: nil)
//        
//        detailedVC.name = theData[indexPath.row].name
//        detailedVC.image = theImageCache[indexPath.row]
//        print("selected")
//        self.presentViewController(detailedVC, animated:true, completion:nil)
//        //navigationController?.pushViewController(detailedVC, animated: true)
//    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        //let productDetailsVC = self.storyboard?.instantiateViewControllerWithIdentifier("productDetailsVC") as ProductDetailsViewController
        
        let detailedVC = Detailed(nibName: "Detailed", bundle: nil)
      
        detailedVC.name = theData[indexPath.row].name
        detailedVC.releaseYear = theData[indexPath.row].year
        detailedVC.rating = theData[indexPath.row].rated
        detailedVC.score = theData[indexPath.row].score
        detailedVC.image = theImageCache[indexPath.row]
        
        //self.presentViewController(detailedVC, animated:true, completion:nil)
       // self.view
        
        
        self.navigationController?.pushViewController(detailedVC, animated: true)
    }
    
    private func getJSON(url: String) -> JSON {
        
        if let nsurl = NSURL(string: url){
            if let data = NSData(contentsOfURL: nsurl) {
                let json = JSON(data: data)
                return json
            } else {
                return nil
            }
        } else {
            return nil
        }
        
    }
    
    
    func fetchDataForCollView() {
        theData.removeAll()
        theImageCache.removeAll()
        
        var enoughMovies = 0;
        if (!searchKeyword.isEmpty){
            
            let urlComponents = NSURLComponents(string: "https://www.omdbapi.com/")!
            
            urlComponents.query = "s=\"\(searchKeyword)\""
            let url = urlComponents.URL!
            
            let json = getJSON(url.absoluteString)
            print("URL: " + String(url))
            for i in json{
                print (i)
            }
            
            //TODO: Make sure you are getting 20 movies
            
            if let items = json["Search"].array {
                for item in items {
                    enoughMovies = enoughMovies + 1
                    
                    let name = item["Title"].stringValue
                    
                    let description = item["Type"].stringValue
                    let year = item["Year"].stringValue
                    
                    var str = item["Poster"].stringValue
                    
                    var id = item["imdbID"].stringValue
                    //get other info from id query
                    
                    
                    urlComponents.query = "i=\"\(id)\""
                    let idUrl = urlComponents.URL!
                    var newUrl : String = idUrl.absoluteString
                    newUrl = newUrl.stringByReplacingOccurrencesOfString("%22", withString: "")
                    let IDjson = getJSON(newUrl)
                    
                    var movierate = IDjson["Rated"].stringValue
                    var movieScore = IDjson["imdbRating"].stringValue
                    
                    var index = str.startIndex.advancedBy(0)
                    var firstChar = str[index]
                    
                    if firstChar == "h"{
                        let url = String(item["Poster"].stringValue)
                        theData.append(Info(name: name, description: description, url: url, year: year, id: id, rated: movierate, score: movieScore))
                    }
                        
                    else{
                        //let url = String("http://ia.media-imdb.com/images/M/MV5BMTc0Mzg5NjY3NF5BMl5BanBnXkFtZTgwMDM1MTg1MTE@._V1_SX300.jpg")
                        let url = String("http://ec2-54-162-69-145.compute-1.amazonaws.com/~elan/noimagefound.jpg")
                        theData.append(Info(name: name, description: description, url: url, year: year, id: id, rated: movierate, score: movieScore))
                    }
                    
                }
            }
            
                
            
            print(theData)
        }
        
    }
    

        
    
    
    func scramble(word: String) -> String {
        var chars = Array(word.characters)
        var result = ""
        
        while chars.count > 0 {
            let index = Int(arc4random_uniform(UInt32(chars.count - 1)))
            chars[index].writeTo(&result)
            chars.removeAtIndex(index)
        }
        
        return result
    }
    
    
    
    func cacheImages() {

        for item in theData {
            
            let url = NSURL(string: item.url)
            let data = NSData(contentsOfURL: url!)
            let image = UIImage(data: data!)
            
            theImageCache.append(image!)
            
        }
        
    }


}


/*extension String {
    func replace(string:String, replacement:String) -> String {
        return self.stringByReplacingOccurrencesOfString(string, withString: replacement, options: NSStringCompareOptions.LiteralSearch, range: nil)
}

    func removeWhitespace() -> String {
        return self.replace(" ", replacement: "")
    }
}


extension String {
    
    func containsWhiteSpace() -> Bool {
        
        // check if there's a range for a whitespace
        let range = self.rangeOfCharacterFromSet(.whitespaceCharacterSet())
        
        // returns false when there's no range for whitespace
        if let _ = range {
            return true
        } else {
            return false
        }
    }
}*/


/*while enoughMovies < 20{
 if searchKeyword.characters.count == 1{
 searchKeyword = "the " + searchKeyword
 }
 else if searchKeyword.containsWhiteSpace(){
 searchKeyword = searchKeyword.removeWhitespace()
 searchKeyword = scramble(searchKeyword)
 }
 else{
 searchKeyword = scramble(searchKeyword)
 }
 
 let urlComponents = NSURLComponents(string: "https://www.omdbapi.com/")!
 
 urlComponents.query = "s=\"\(searchKeyword)\""
 let url = urlComponents.URL!
 
 let json = getJSON(url.absoluteString)
 
 if let items = json["Search"].array {
 for item in items {
 enoughMovies = enoughMovies + 1
 
 let name = item["Title"].stringValue
 
 for names in theData{
 if name == names.id{
 enoughMovies = enoughMovies - 1
 continue
 }
 }
 
 let description = item["Type"].stringValue
 let year = item["Year"].stringValue
 
 var str = item["Poster"].stringValue
 
 var id = item["imdbID"].stringValue
 //get other info from id query
 
 
 urlComponents.query = "i=\"\(id)\""
 let idUrl = urlComponents.URL!
 var newUrl : String = idUrl.absoluteString
 newUrl = newUrl.stringByReplacingOccurrencesOfString("%22", withString: "")
 let IDjson = getJSON(newUrl)
 
 var movierate = IDjson["Rated"].stringValue
 var movieScore = IDjson["imdbRating"].stringValue
 
 var index = str.startIndex.advancedBy(0)
 var firstChar = str[index]
 
 if firstChar == "h"{
 let url = String(item["Poster"].stringValue)
 theData.append(Info(name: name, description: description, url: url, year: year, id: id, rated: movierate, score: movieScore))
 }
 
 else{
 let url = String("http://ia.media-imdb.com/images/M/MV5BMTc0Mzg5NjY3NF5BMl5BanBnXkFtZTgwMDM1MTg1MTE@._V1_SX300.jpg")
 theData.append(Info(name: name, description: description, url: url, year: year, id: id, rated: movierate, score: movieScore))
 }
 
 }
 }
 }*/
