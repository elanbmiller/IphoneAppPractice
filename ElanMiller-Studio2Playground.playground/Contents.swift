//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var point = CGPoint(x: 0.0, y: 0.0)
var size = CGSize(width: 42.0, height:27.0)

var rect = CGRect(x:point.x, y:point.y ,width:size.width ,height:size.height )

var frame = rect

var	myView	=	UIView(frame: frame)
myView.backgroundColor = UIColor.blueColor()


var newPoint = CGPoint(x: 0.0, y: 0.0)
var newSize = CGSize(width: 21.0, height:13.5)

var newRect = CGRect(x:newPoint.x, y:newPoint.y ,width:newSize.width ,height:newSize.height )
//var newRect2 = CGRect(x:0, y:0, width: 5, height: 5)

var newFrame = newRect

var	newMyView	=	UIView(frame: newRect)
newMyView.backgroundColor = UIColor.redColor()


myView.addSubview(newMyView)



var color = UIColor(red: 255,green: 0,blue: 255, alpha: 100)



let	someFrame	=	CGRect(x:0.0,y:0.0,	width:100,height:100)
let	myLabel	=	UILabel.init(frame:someFrame)
myLabel.textAlignment = .Center
myLabel.textColor = color
myLabel.text	= "Hello"


let btn = UIButton(frame: CGRectMake(0, 0, 100, 100))
btn.layer.cornerRadius = 20
btn.backgroundColor = UIColor.blackColor()
btn.setTitle("Button", forState: UIControlState.Normal)




let mySlider = UISlider(frame: someFrame)
mySlider.maximumValue = 100
mySlider.minimumValue = -100
mySlider.thumbTintColor = UIColor.redColor()

//let url = NSURL(string:"https://www.google.com/imgres?imgurl=http%3A%2F%2Fcdn2-www.dogtime.com%2Fassets%2Fuploads%2Fgallery%2F30-impossibly-cute-puppies%2Fimpossibly-cute-puppy-8.jpg&imgrefurl=http%3A%2F%2Fdogtime.com%2Fpuppies%2F255-puppies&docid=G-LgqdMgurST3M&tbnid=WRw9Hwzh5IWNZM%3A&w=680&h=606&bih=902&biw=1312&ved=0ahUKEwjj3Ib535HPAhXKxYMKHc7GAV8QMwg-KAAwAA&iact=mrc&uact=8")

//let data = NSData(contentsOfURL:url!)

let dogPic = UIImage(data: NSData.init(contentsOfURL: NSURL.init(string: "https://img.buzzfeed.com/buzzfeed-static/static/2015-06/4/11/enhanced/webdr09/enhanced-11495-1433433269-1.jpg?no-auto")!)!)

let viewImage = UIImageView(image: dogPic)
viewImage.alpha = 0.5


class OverrideObject: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.redColor()
        self.layer.cornerRadius = 30
    }
    //required (not sure what it does)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
let newShape = OverrideObject(frame: someFrame)





