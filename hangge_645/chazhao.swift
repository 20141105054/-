
import UIKit
class chazhao: UIViewController {
    @IBAction func qingchu(sender: AnyObject) {
        text.text=""
    }
    @IBAction func qingkong(sender: AnyObject) {

        let sql = "delete from t_user"
        let result = db.execute(sql)
        print(result)

    }
    @IBOutlet weak var text: UITextView!
    @IBAction func chazhao1(sender: AnyObject) {
        selete()
        
    }
    var db:SQLiteDB!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20),address varchar(20),email varchar(20))")
        //如果有数据则加载
        // initUser()
    }
    func selete(){
        let data = db.query("select * from t_user")
        for var x=0;x<data.count;x++
        {
            //获取最后一行数据显示
            let tuser = data[x]
            text.text! += "姓名：" + String(tuser["uname"]!) + " 电话：" + String(tuser["mobile"]!)+"\n"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }   
    //保存数据到SQLite
}