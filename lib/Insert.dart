import 'package:flutter/material.dart';
import 'package:practiceprograms/View.dart';

import 'DataBaseHelper.dart';

class Insert extends StatefulWidget {

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  var grpvalue = "Male";
  TextEditingController _title = TextEditingController();
  TextEditingController _remark = TextEditingController();
  TextEditingController _amount = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Insert Page "),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: 650,
          child: Card(
            elevation: 20,
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
                  child: Text("Description"),
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
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Amount"),
                ),
                Container(
                  decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
                  child: TextField(
                    controller: _amount,
                    keyboardType: TextInputType.number,
                    // controller: _contact,
                  ),
                ),
                SizedBox(
                  height: 50,
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
                  onTap: () async {
                    var ti = _title.text.toString();
                    var re = _remark.text.toString();
                    var am = _amount.text.toString();
                    var sa = grpvalue.toString();

                    DataBaseHelper obj = new DataBaseHelper();
                    var id = await obj.addPractice(ti, re, am, sa);
                    print("Record Insert At :" + id.toString());

                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => View()));
                  },
                  child: Container(
                    width: 60,
                    decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Text("Insert"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
