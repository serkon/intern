import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class PhoneCall extends StatefulWidget {
  PhoneCall({Key key}) : super(key: key);

  @override
  PhoneCallState createState() => PhoneCallState();
}

class PhoneCallState extends State<PhoneCall> {
  List tumVeriler = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    veriOku().then((gelen) {
      //başlangıçta çalışacak uygulaya okuduğumuz verileri aktardık.
      setState(() {
        tumVeriler = gelen;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1c1a34),
      appBar: AppBar(
        title: Text(
          "Phone Numbers",
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1c1a34),
      ),
      body: Container(
        child: ListView.builder(
            padding: const EdgeInsets.all(0.0),
            itemCount: tumVeriler.length + 1,
            //jsondan gelen veri adetine göre bir boyuta sahip olacak listeyi oluşturduk.
            itemBuilder: (BuildContext context, int index) {
              if (index == tumVeriler.length) {
                return Container(
                    //son elemanda geldikten sonra en alta buton oluştur.
                    alignment: Alignment.centerLeft,
                    child: Container(
                      color: Color(0xFF1c1a34),
                      child: Padding(
                        //butonun konum padingi
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 5, bottom: 8),
                        //boyutları height widht olarak verdiğimde sığmıyor içeri
                        child: RaisedButton(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                // buton içi yazı konumu
                                left: 15,
                                right: 15,
                                top: 16,
                                bottom: 16),
                            child: Text(
                              "Add Phone Numbers",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                          color: Color(0xFF1c1a34),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFFffffff)),
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {},
                        ),
                      ),
                    ));
              } else {
                return Column(
                  children: <Widget>[
                    Slidable(
                      actionPane: SlidableScrollActionPane(),
                      actionExtentRatio: 0.25,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        //bölümler arası mesafe ayarı
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                          Row(
                            //telefon adı ve alanını bi rowda ayarladık.
                            children: <Widget>[
                              Container(
                                child: Text(
                                  tumVeriler[index]["tel_ad"] + " phone",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12), //work home konumu
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        12, 6, 12, 6), // work dış kalıp boyutu
                                    child: Text(
                                      tumVeriler[index]["cep"],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)),
                                      color: Color(0xFF5e50e4)),
                                ),
                              ),
                            ],
                          ),
                          Row(//kilit ve telefon noyu berabar konumlandırdık.
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 12),
                                //kilit konumu
                                child: Container(
                                  child: tumVeriler[index]["kilit"] == true
                                      ? Icon(
                                          Icons.lock,
                                          color: Colors.grey,
                                          size: 18.75,
                                        )
                                      : null,
                                ),
                              ),
                              Container(
                                child: Text(
                                  tumVeriler[index]["tel_no"],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              )
                            ],
                          ),
                            ],
                          ),
                        ),
                      ),
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          //sola sürükleyince
                          color: Colors.green.shade500,
                          foregroundColor: Colors.white,
                          icon: Icons.call,
                          onTap: () {
                            UrlLauncher.launch(
                                'tel:0${tumVeriler[index]["tel_no"].toString()}');
                          },
                        )
                      ],
                    ),
                    Container(
                      //bölümler arası çizgi ayarı
                      color: Colors.grey,
                      height: 0.7,
                    )
                  ],
                );
              }
            }),
      ),
    );
  }

  Future<List> veriOku() async {
    var gelenJson =
        await DefaultAssetBundle.of(context) //json içindeki veriyi tutuyoruz.
            .loadString("assets/data/veriler.json");

    List bilgiList = json.decode(gelenJson
        .toString()); //jsondan aldığım bilgiyi liste formatına geçirdik.
    return bilgiList;
  }
}
