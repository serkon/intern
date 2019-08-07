import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomListItemPhone extends StatelessWidget {
  List<String> phoneList;
  int index;

  CustomListItemPhone(List<String> entries, int index, {Key key}) : super(key: key) {
    this.phoneList = entries;
    this.index = index;
  }

  int secim = 1, security = 1;

  @override
  Widget build(BuildContext context) {
    var heightt = MediaQuery.of(context).size.height / 100;
    // TODO: implement build
    if (index == phoneList.length) {
      return Container(
          alignment: Alignment.centerLeft,
          child: Container(
            color: Color(0xFF1c1a34),
            child: Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 5),
                child: SizedBox(
                  //height: 40,   bu boyutları verirsek aşırı ufak boyutta oluyor yazı sığmıyor.
                  //width: 151,
                  child: RaisedButton(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 15, bottom: 15),
                      child: Text(
                        "Add Phone Numbers",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    color: Color(0xFF1c1a34),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xFFffffff)),
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      /*
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddNumbers())); */
                    },
                  ),
                )),
          ));
    } else {
      return Column(
        children: <Widget>[
          Slidable(
            actionPane: SlidableScrollActionPane(),
            actionExtentRatio: 0.25,
            child: Container(
              height: 69, //heightt / (100 / 1100), // Cardlar arası boyut
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    //color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 0, top: 17),
                                  child: Text(
                                    '${phoneList[index]} Phone',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, top: 15.0),
                                child: Container(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(12, 6, 12, 6),
                                    child: secim == 1
                                        ? Text(" work",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16))
                                        : Text("Home",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16)),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14)),
                                    color: Color(0xFF5e50e4),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              security == 1
                                  ? Padding(
                                  padding:
                                  const EdgeInsets.only(right: 6.0),
                                  child: Container(
                                    child: Icon(
                                      Icons.lock,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                  ))
                                  : Padding(
                                  padding:
                                  const EdgeInsets.only(right: 6.0),
                                  child: Container()),
                              Container(
                                child: Text(
                                  "(5454) 5564654",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            secondaryActions: <Widget>[
              //sola istenirse action: yap
              IconSlideAction(
                  color: Colors.green.shade500,
                  foregroundColor: Colors.white,
                  icon: Icons.call,
                  onTap: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("${phoneList[index]} Phone Aranıyor..."),
                      duration: Duration(milliseconds: 500),
                    ));
                  }),
            ],
          ),
          Container(
            color: Colors.grey,
            height: 0.5,
          ),
        ],
      );
    }
  }
}
