//
//  Detailed.swift
//  Lab4
//
//  Created by Labuser on 10/13/16.
//  Copyright © 2016 wustl. All rights reserved.
//

import UIKit
import WebKit

class Detailed: UIViewController, WKNavigationDelegate {
    
    //var favorites: [String] = []
    var webView = WKWebView()
    
    var image: UIImage!
    var name: String!
    
    var releaseYear : String!
    var score : String!
    var rating : String!
    

    @IBOutlet weak var detailedPoster: UIImageView!
    @IBOutlet weak var detailedTitle: UILabel!//release year
    @IBOutlet weak var detailedScore: UILabel!
    @IBOutlet weak var detailedRating: UILabel!
    
    @IBOutlet weak var urlButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailedPoster.image = image     //poster image
        detailedTitle.text = "Released: " + releaseYear
        detailedScore.text = "IMDB Score: " + score
        detailedRating.text = "Rated: " + rating
        
        
        /*if urlButton.touchInside{
            let url = NSURL(string: "https://www.google.com")!
            
            webView.loadRequest(NSURLRequest(URL:url))
            
            webView.allowsBackForwardNavigationGestures = true
        }*/
        
        //urlButton.addTarget(self, action: "googleMovie", forControlEvents: .TouchUpInside)
       // print("loading Detailed")
}

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    @IBAction func addToFavs(sender: AnyObject) {
        
        //let favorites = GlobalVariables.data
        
        //favorites.append(name)
        
        Favorites.GlobalVariables.data.append(name)
        
        
        
        //for favorite in Favorites.GlobalVariables.data{
        //    print(favorite)
        //}
        
        
    }
    
    @IBAction func googleThis(sender: AnyObject) {
       /* var queryName = ""
        if name.containsWhiteSpace(){
            queryName = name.removeWhitespace()
        }
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.google.com/#q=" + name! )!)*/
        
        
        var urlString: String = name
        urlString = urlString.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.LiteralSearch, range: nil)
        let url = NSURL(string: "http://www.google.com/search?q=\(urlString)")
        UIApplication.sharedApplication().openURL(url!)
        //let request = NSURLRequest(URL: url!)
        //self.webView.loadRequest(request)
    }
    
    
 

}

extension String {
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
}
