import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper{

  Database db;
  Future<Database> create_db() async
  {

    if(db!=null)
    {
      //database already created
      return db;
    }
    else
    {
      //new create
      Directory dir = await getApplicationDocumentsDirectory();
      // String path = join(dir.path,"shop_db");
      String path = join(dir.path,"shop_db");



      var db = await openDatabase(path,version: 1,onCreate: create_table);
      return db;
    }
  }
  create_table(Database db,int version)
  {
    db.execute("create table practice (tid integer primary key autoincrement,title text,remark text,amount number,salary text)");
    print("Table Created");
  }

  Future<int> addPractice(ti,re,am,sa) async
  {
    var db = await create_db();
    var id = await db.rawInsert("insert into practice (title,remark,amount,salary) values (?,?,?,?)",[ti,re,am,sa]);
    return id;
  }

  Future<List> viewPractice() async
  {
    var db = await create_db();
    var pro = await db.rawQuery("select * from practice");
    return pro.toList();
  }

  Future<int> deletePractice(id) async
  {
    var db = await create_db();
    var prac = await db.rawDelete("delete from practice where tid=?",[id]);
    return prac;
  }

  Future<int> updatePractice(ti,re,am,sa,updateid) async
  {
    var db = await create_db();
    var pract = await db.rawUpdate("update data set title=?,remark=?,amount=?,salary=? where tid=?",[ti,re,am,sa,updateid]);
    return pract;
  }
  Future<List>  getsingledata(id,sa) async
  {
    var db = await create_db();
    var data = await db.rawQuery("select * from practice where tid=?",[id]);
    return data.toList();
  }
}