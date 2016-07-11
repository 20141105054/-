import UIKit

class shanchu: UIViewController {
    @IBAction func del(sender: AnyObject) {
        del()
    }
    @IBOutlet weak var text1: UITextView!
    
    var db:SQLiteDB!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists song(uid integer primary key,uname varchar(20),mobile varchar(20),address varchar(20),mail varchar(20))")
    }
    func del(){
        let a=text1.text!
        let sql = "delete from szy where uname='\(a)'"
        let result = db.execute(sql)
        print(result)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
