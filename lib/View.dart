import 'package:flutter/material.dart';
import 'package:practiceprograms/Insert.dart';
import 'package:practiceprograms/UpdatePage.dart';

import 'DataBaseHelper.dart';

class View extends StatefulWidget {
  var updateid="";
  View({this.updateid});
  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  Future<List> alldata;
  Future<List> getdata() async
  {
    DataBaseHelper obj =new DataBaseHelper();
    var pro = await obj.viewPractice();
    var data = await obj.viewPractice();
    return pro;
    return data;
  }
  @override
  void initState() {
    super.initState();
    setState((){
      alldata = getdata();
    });
  }

  var grpvalue="Income";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sqflite (practiceflutter) "),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => Insert()));
        },
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: FutureBuilder(
        future: alldata,
        builder: (context,snapshots)
        {
          if(snapshots.hasData)
          {
            if(snapshots.data.length<=0)
            {
              return Center(
                child: Text("No Practice Found"),
              );
            }
            else
            {
              return ListView.builder(
                itemCount: snapshots.data.length,
                itemBuilder: (context,index)
                {
                  return
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Container(
                        height: 200,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            color: Colors.white38,
                            elevation: 20,

                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.only(left: 120.0),
                                  child: Row(
                                    children: [
                                      Text("Title :",style: TextStyle(color: Colors.black),),
                                      Text(snapshots.data[index]["title"].toString(),  style: TextStyle(color: Colors.blueAccent),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 120.0),
                                  child: Row(
                                    children: [
                                      Text("Remark :",style: TextStyle(color: Colors.black),),
                                      Text(snapshots.data[index]["remark"].toString(),style: TextStyle(color: Colors.blueAccent),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 120.0),
                                  child: Row(
                                    children: [
                                      Text("Amount :",style: TextStyle(color: Colors.black),),
                                      Text(snapshots.data[index]["amount"].toString(),style: TextStyle(color: Colors.blueAccent),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 120.0),
                                  child: Row(
                                    children: [
                                      Text("Salary :",style: TextStyle(color: Colors.black),),
                                      Text(snapshots.data[index]["salary"].toString(),style: TextStyle(color: Colors.blueAccent),),
                                    ],
                                  ),
                                ),


                                // var id = snapshots.data[index]["sid"].toString();
                                // Navigator.of(context).push(
                                //     MaterialPageRoute(
                                //         builder: (context) => UpdatePage(updateid: id)));
                                SizedBox(height: 20,),
                                Row(

                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(

                                      child: GestureDetector(
                                        onTap: () {
                                          AlertDialog alert = AlertDialog(
                                            title: Row(
                                              children: [

                                                // main row ke ander column dali to bhi row me column nhi aya
                                                Column(
                                                  children: [
                                                    Text("Alert.."),
                                                  ],
                                                ),
                                                SizedBox(height: 10 ,),
                                                TextButton(
                                                  onPressed: () async{
                                                    var id = snapshots.data[index]["tid"].toString();
                                                    DataBaseHelper obj = new DataBaseHelper();
                                                    var prac = await obj.deletePractice(id);
                                                    if(prac==1)
                                                    {
                                                      setState((){
                                                        alldata = getdata();
                                                      });
                                                    }
                                                    else
                                                    {
                                                      print("Delete Error");
                                                    }
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text("Delete"),
                                                ),
                                                TextButton(
                                                  onPressed: (){
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text("Cancel"),
                                                ),
                                              ],
                                            ),
                                          );
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return alert;
                                            },
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(),
                                          child: Container(
                                              width: 90,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.black),
                                                color: Colors.green[400],
                                              ),
                                              child: Center(child: Text("Delete ",style: TextStyle(),))),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: GestureDetector(
                                        onTap: () {
                                          // Navigator.of(context).push(
                                          //     MaterialPageRoute(
                                          //         builder: (context) => UpdatePage(updateid: id)));
                                          var id = snapshots.data[index]["tid"].toString();
                                          Navigator.of(context).push(
                                              MaterialPageRoute( builder: (context) => UpdatePage(updateid: id,))
                                          );

                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(),
                                          child: Container(
                                              width: 90,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.black),
                                                color: Colors.green[200],
                                              ),
                                              child: Center(child: Text("Update",style: TextStyle(),))),
                                        ),
                                      ),
                                    ),
                                  ],

                                ),
                              ],
                            ),

                          ),
                        ),
                      ),
                    );
                },
              );
            }
          }
          else
          {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
