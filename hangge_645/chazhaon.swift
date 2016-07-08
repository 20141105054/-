//
//  chazhaon.swift
//  hangge_645
//
//  Created by 20141105054 on 16/7/8.
//  Copyright © 2016年 hangge.com. All rights reserved.
//


import UIKit
class chazhaon: UIViewController {
    @IBOutlet weak var textf: UITextField!
    @IBOutlet weak var text1: UITextView!
    @IBAction func name(sender: AnyObject) {
         sn()
    }
    var db:SQLiteDB!
    func sn()
    {
        text1.text=""
        let a=textf.text!
        let data = db.query("select * from t_user where uname='\(a)'")
        for var x=0;x<data.count;x++
        {
            
            
            //获取最后一行数据显示
            let tuser = data[x]
            text1.text! += "姓名：" + String(tuser["uname"]!) + " 电话：" + String(tuser["mobile"]!)+"\n"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        //如果有数据则加载
        // initUser()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //保存数据到SQLite
}