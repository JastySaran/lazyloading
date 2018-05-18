//
//  ViewController.swift
//  LazyLoading
//
//  Created by Jasty Saran on 5/18/18.
//  Copyright © 2018 Jasty Saran. All rights reserved.
//
//---------------**------**---------------------**-------------------**------------------**-----------**
import UIKit
import Nuke
//---------------**------**---------------------**-------------------**------------------**-----------**
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    @IBOutlet weak var scrollView: UIScrollView!
    var topRefreshControl: UIRefreshControl?
    var array = [Any]()
    var imgaesArray = [Any]()
    var numberOfItems: Int = 0
    var lastContentOffset: CGFloat = 0
    @IBOutlet weak var tableView: UITableView!
//---------------**------**---------------------**-------------------**------------------**-----------**
    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
        numberOfItems = 5
        self.title = "Lazy Loading"
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
        array = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20","21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40","41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60"]
//---------------**------**---------------------**-------------------**------------------**-----------**
        imgaesArray = ["https://i.ndtvimg.com/i/2018-02/teddy-day-images-pexels-650_650x400_61518152570.jpg","https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2016/03/1458289957powerful-images3.jpg","https://images.freeimages.com/images/small-previews/e71/frog-1371919.jpg","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdmVKRNCco4NJTQG0gfocCOFFyWu0qZtAD-wsRtvva8P63ICU-bw","https://i1.wp.com/thefreshimages.com/wp-content/uploads/2017/08/lord-shiva-images-12.jpg?resize=564%2C560&ssl=1","https://i.ndtvimg.com/i/2018-02/teddy-day-images-pexels-650_650x400_61518152570.jpg","https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2016/03/1458289957powerful-images3.jpg","https://images.freeimages.com/images/small-previews/e71/frog-1371919.jpg","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdmVKRNCco4NJTQG0gfocCOFFyWu0qZtAD-wsRtvva8P63ICU-bw","https://i1.wp.com/thefreshimages.com/wp-content/uploads/2017/08/lord-shiva-images-12.jpg?resize=564%2C560&ssl=1","https://i.ndtvimg.com/i/2018-02/teddy-day-images-pexels-650_650x400_61518152570.jpg","https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2016/03/1458289957powerful-images3.jpg","https://images.freeimages.com/images/small-previews/e71/frog-1371919.jpg","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdmVKRNCco4NJTQG0gfocCOFFyWu0qZtAD-wsRtvva8P63ICU-bw","https://i1.wp.com/thefreshimages.com/wp-content/uploads/2017/08/lord-shiva-images-12.jpg?resize=564%2C560&ssl=1","https://i.ndtvimg.com/i/2018-02/teddy-day-images-pexels-650_650x400_61518152570.jpg","https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2016/03/1458289957powerful-images3.jpg","https://images.freeimages.com/images/small-previews/e71/frog-1371919.jpg","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdmVKRNCco4NJTQG0gfocCOFFyWu0qZtAD-wsRtvva8P63ICU-bw","https://i1.wp.com/thefreshimages.com/wp-content/uploads/2017/08/lord-shiva-images-12.jpg?resize=564%2C560&ssl=1","https://i.ndtvimg.com/i/2018-02/teddy-day-images-pexels-650_650x400_61518152570.jpg","https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2016/03/1458289957powerful-images3.jpg","https://images.freeimages.com/images/small-previews/e71/frog-1371919.jpg","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdmVKRNCco4NJTQG0gfocCOFFyWu0qZtAD-wsRtvva8P63ICU-bw","https://i1.wp.com/thefreshimages.com/wp-content/uploads/2017/08/lord-shiva-images-12.jpg?resize=564%2C560&ssl=1","https://i.ndtvimg.com/i/2018-02/teddy-day-images-pexels-650_650x400_61518152570.jpg","https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2016/03/1458289957powerful-images3.jpg","https://images.freeimages.com/images/small-previews/e71/frog-1371919.jpg","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdmVKRNCco4NJTQG0gfocCOFFyWu0qZtAD-wsRtvva8P63ICU-bw","https://i1.wp.com/thefreshimages.com/wp-content/uploads/2017/08/lord-shiva-images-12.jpg?resize=564%2C560&ssl=1","https://i.ndtvimg.com/i/2018-02/teddy-day-images-pexels-650_650x400_61518152570.jpg","https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2016/03/1458289957powerful-images3.jpg","https://images.freeimages.com/images/small-previews/e71/frog-1371919.jpg","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdmVKRNCco4NJTQG0gfocCOFFyWu0qZtAD-wsRtvva8P63ICU-bw","https://i1.wp.com/thefreshimages.com/wp-content/uploads/2017/08/lord-shiva-images-12.jpg?resize=564%2C560&ssl=1","https://i.ndtvimg.com/i/2018-02/teddy-day-images-pexels-650_650x400_61518152570.jpg","https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2016/03/1458289957powerful-images3.jpg","https://images.freeimages.com/images/small-previews/e71/frog-1371919.jpg","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdmVKRNCco4NJTQG0gfocCOFFyWu0qZtAD-wsRtvva8P63ICU-bw","https://i1.wp.com/thefreshimages.com/wp-content/uploads/2017/08/lord-shiva-images-12.jpg?resize=564%2C560&ssl=1","https://i.ndtvimg.com/i/2018-02/teddy-day-images-pexels-650_650x400_61518152570.jpg","https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2016/03/1458289957powerful-images3.jpg","https://images.freeimages.com/images/small-previews/e71/frog-1371919.jpg","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdmVKRNCco4NJTQG0gfocCOFFyWu0qZtAD-wsRtvva8P63ICU-bw","https://i1.wp.com/thefreshimages.com/wp-content/uploads/2017/08/lord-shiva-images-12.jpg?resize=564%2C560&ssl=1","https://i.ndtvimg.com/i/2018-02/teddy-day-images-pexels-650_650x400_61518152570.jpg","https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2016/03/1458289957powerful-images3.jpg","https://images.freeimages.com/images/small-previews/e71/frog-1371919.jpg","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdmVKRNCco4NJTQG0gfocCOFFyWu0qZtAD-wsRtvva8P63ICU-bw","https://i1.wp.com/thefreshimages.com/wp-content/uploads/2017/08/lord-shiva-images-12.jpg?resize=564%2C560&ssl=1","https://i.ndtvimg.com/i/2018-02/teddy-day-images-pexels-650_650x400_61518152570.jpg","https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2016/03/1458289957powerful-images3.jpg","https://images.freeimages.com/images/small-previews/e71/frog-1371919.jpg","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdmVKRNCco4NJTQG0gfocCOFFyWu0qZtAD-wsRtvva8P63ICU-bw","https://i1.wp.com/thefreshimages.com/wp-content/uploads/2017/08/lord-shiva-images-12.jpg?resize=564%2C560&ssl=1","https://i.ndtvimg.com/i/2018-02/teddy-day-images-pexels-650_650x400_61518152570.jpg","https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2016/03/1458289957powerful-images3.jpg","https://images.freeimages.com/images/small-previews/e71/frog-1371919.jpg","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdmVKRNCco4NJTQG0gfocCOFFyWu0qZtAD-wsRtvva8P63ICU-bw","https://i1.wp.com/thefreshimages.com/wp-content/uploads/2017/08/lord-shiva-images-12.jpg?resize=564%2C560&ssl=1"]
//---------------**------**---------------------**-------------------**------------------**-----------**
        print(imgaesArray.count)
        let refreshControl = UIRefreshControl()
        refreshControl.triggerVerticalOffset = 60.0
        refreshControl.addTarget(self, action: #selector(self.refreshBottom), for: .valueChanged)
        scrollView.bottomRefreshControl = refreshControl
    }
//---------------**------**---------------------**-------------------**------------------**-----------**
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//---------------**------**---------------------**-------------------**------------------**-----------**
    @objc func refreshBottom(){
        if (self.array.count < self.numberOfItems){
        self.scrollView.bottomRefreshControl?.endRefreshing()
        }else{
            self.numberOfItems += 5
            self.reloadData()
            self.scrollView.bottomRefreshControl?.endRefreshing()
        }
    }
//---------------**------**---------------------**-------------------**------------------**-----------**
    @objc func scrollTop(){
        numberOfItems = max(0, numberOfItems - 5)
        reloadData()
        topRefreshControl?.endRefreshing()
    }
//---------------**------**---------------------**-------------------**------------------**-----------**
    @objc func reloadData(){ self.tableView.reloadData()}
//---------------**------**---------------------**-------------------**------------------**-----------**
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (array.count) < (numberOfItems) { return array.count }
        else { return numberOfItems }
    }
//---------------**------**---------------------**-------------------**------------------**-----------**
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let lbl = cell?.viewWithTag(1) as? UILabel
        lbl?.text = array[indexPath.row] as? String
        let imgView = cell?.viewWithTag(2) as? UIImageView
        let urlstring = imgaesArray[indexPath.row]
        let url = URL(string: urlstring as! String)
        Nuke.loadImage(with: url!, into: imgView!)
        if let aCell = cell { return aCell }
        return UITableViewCell()
    }
//---------------**------**---------------------**-------------------**------------------**-----------**
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
//---------------**------**---------------------**-------------------**------------------**-----------**
}

