import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var mail: UITextField!

    var db:SQLiteDB!
    @IBOutlet var txtUname: UITextField!
    @IBOutlet var txtMobile: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表
        db.execute("create table if not exists szy(uid integer primary key,uname varchar(20),mobile varchar(20),address varchar(20),mail varchar(20))")

    }
    //点击保存
    @IBAction func saveClicked(sender: AnyObject) {
        saveUser()
    }
    //从SQLite加载数据
    func initUser() {
        let data = db.query("select * from szy")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            txtUname.text = user["uname"] as? String
            txtMobile.text = user["mobile"] as? String
            mail.text = user["mail"] as?String
            address.text = user["address"] as?String
        }
            }
    
    //保存数据到SQLite
    func saveUser() {
        let txtUname = self.txtUname.text!
        let txtMobile = self.txtMobile.text!
        let mail=self.mail.text!
        let address=self.address.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into szy(uname,mobile,mail,address) values('\(txtUname)','\(txtMobile)','\(mail)','\(address)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}