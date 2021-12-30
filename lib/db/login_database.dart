import 'package:loginpage_sql/model/login.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LoginDatabase{
  static final _tableName= "myTable";
  static final columnId="id";
  static final columnEmail="email";
  static final columnPasswd="passwd";


  static final LoginDatabase instance = LoginDatabase._init();

  void initState(){
    this.initState();
    _database!.close();
  }
  static  Database? _database;
  LoginDatabase._init();



  Future<Database> get database async{
    if(_database!= null)
      return _database!;

    _database = await _initDb("logincredential.db");
    return _database!;
  }
  _initDb(String filePath) async {
    final dpPath= await getDatabasesPath();
    final path = join(dpPath,filePath);

    return await openDatabase(path,version: 1,onCreate: onCreateDB);


  }
 Future onCreateDB(Database db,int version) async {

   await  db.execute("""CREATE TABLE $_tableName(
   $columnId INTEGER PRIMARY KEY,
    $columnEmail email Text NOT NULL,
    $columnPasswd passwd Text NOT NULL

)"""
);


  }
  Future<int> create(LoginCredential loginCredential) async{
    final db = await instance.database;
   return await  db.insert(_tableName,loginCredential.toJson() );




  }
  Future<List<LoginCredential>> read() async{
    final db = await instance.database;
    List<Map<String,dynamic>> update =await db.query(_tableName);
     return update.map((e) => LoginCredential.fromJson(e)).toList();

  }
  Future<void> delete() async {
    final db = await instance.database;
      await db.delete(_tableName);
  }

}