import 'package:flutter/material.dart';
import 'package:practiceprograms/View.dart';

import 'DataBaseHelper.dart';

class UpdatePage extends StatefulWidget {
  var updateid="";
  UpdatePage({this.updateid});
  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  getdata() async
  {
    DataBaseHelper obj = new DataBaseHelper();
    var data = await obj.getsingledata(widget.updateid, grpvalue);
    setState((){
      _title.text = data[0]["title"].toString();
      _remark.text = data[0]["remark"].toString();
      _amount.text = data[0]["amount"].toString();
      grpvalue = data[0]["salary"].toString();
    });
  }
  TextEditingController _title = TextEditingController();
  TextEditingController _remark = TextEditingController();
  TextEditingController _amount = TextEditingController();
  var grpvalue = "Income";
  @override
  void initState() {
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Sqflite (practiceflutter) Update"),
      ),
      body: SingleChildScrollView(
        child:   Column(
          children: [
            Container(
              height: 560,
              color: Colors.red,
              child: Card(
                elevation: 30,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Title"),
                    ),
                    Container(
                      decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                      child: TextField(
                        controller: _title,
                        keyboardType: TextInputType.text,
                        // controller: _contact,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("remark"),
                    ),
                    Container(
                      decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                      child: TextField(
                        controller: _remark,
                        keyboardType: TextInputType.text,
                        // controller: _contact,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("amount"),
                    ),
                    Container(
                      decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                      child: TextField(
                        controller: _amount,
                        keyboardType: TextInputType.text,
                        // controller: _contact,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Text(
                            "Salary :",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text("Income :"),
                        Radio(
                            value: "Income",
                            groupValue: grpvalue,
                            onChanged: (val) {
                              setState(() {
                                grpvalue = (val);
                              });
                            }),
                        Text("Expense :"),
                        Radio(
                            value: "Expense",
                            groupValue: grpvalue,
                            onChanged: (val) {
                              setState(() {
                                grpvalue = (val);
                              });
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () async{

                        var ti = _title.text.toString();
                        var re = _remark.text.toString();
                        var am = _amount.text.toString();
                        var sa = grpvalue;

                        DataBaseHelper obj = DataBaseHelper();
                        obj.updatePractice(ti,re,am,sa,widget.updateid);
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>View())
                        );
                      },
                      child: Container(
                          width: 70,

                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)

                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Text("Update",style: TextStyle(),),
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
