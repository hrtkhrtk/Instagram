//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by hirotaka.iwasaki on 2020/01/04.
//  Copyright © 2020 hirotaka.iwasaki. All rights reserved.
//

import UIKit

//class PostTableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
//    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var commentLabel: UILabel!
    
    var commentArray:[Comment] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //print("test0105n01")
        //print(tableView)
//        tableView.delegate = self
//        tableView.dataSource = self
        
        // テーブルセルのタップを無効にする
//        tableView.allowsSelection = false
        
        //let nib = UINib(nibName: "UITableViewCell", bundle: nil)
        //tableView.register(nib, forCellReuseIdentifier: "InsideCell")
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "InsideCell") // 参考：vhttps://github.com/mixi-inc/iOSTraining/blob/master/Swift/pages/day2/3-1_UITableView.md
        
        //commentTextField.text = "testn01" // 不要
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPostData(_ postData: PostData) {
        self.postImageView.image = postData.image
        
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = formatter.string(from: postData.date!)
        self.dateLabel.text = dateString
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
        
        self.commentArray = postData.commentArray
        //for index in (0..<commentArray.count) {
        //    print("test0106n01 " + String(commentArray[index].id))
        //}
//        tableView.reloadData()
        var comments = ""
        for commentElement in commentArray {
            comments += commentElement.name + ": " + commentElement.comment + "\n"
            //comments += commentElement.name + ": " + commentElement.comment
        }
        self.commentLabel.text = comments
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        //print("test0105n07 " + String(self.commentArray.count) + " " + self.commentArray[section].id)
//        print("test0105n07 " + String(self.commentArray.count))
//        return self.commentArray.count
//    }

//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // 再利用可能な cell を得る
//        let cell = tableView.dequeueReusableCell(withIdentifier: "InsideCell", for: indexPath)
//        print("test0105n08")
//        print(cell)
//
//        let comment = self.commentArray[indexPath.row]
//        cell.textLabel?.text = comment.comment
//        cell.detailTextLabel?.text = comment.name
//
//        return cell
//    }
}
