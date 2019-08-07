import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Email extends StatefulWidget {

  @override
  EmailState createState() => EmailState();
}

class EmailState extends State<Email> {
  List tumMailler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    veriOku().then((gelen) { //başlangıçta çalışacak uygulaya okuduğumuz verileri aktardık.
      setState(() {
        tumMailler = gelen;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1c1a34),
      appBar: AppBar(
        title: Text(
          "E-mail Adresses",
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1c1a34),
      ),
      body: Container(
        child: ListView.builder(
            padding: const EdgeInsets.all(0.0),
            itemCount: tumMailler.length + 1, //jsondan gelen veri adetine göre bir boyuta sahip olacak listeye değer verdik.
            itemBuilder: (BuildContext context, int index) {
              if (index == tumMailler.length) {
                return Container( //son elemana geldikten sonra en alta buton oluştur.
                    alignment: Alignment.centerLeft,
                    child: Container(
                      color: Color(0xFF1c1a34),
                      child: Padding( //butonun konum padingi
                        padding: const EdgeInsets.only(top: 15.0, left: 5,bottom: 8),//boyutları height widht olarak verdiğimde sığmıyor içeri
                        child: RaisedButton(
                          child: Padding(
                            padding: const EdgeInsets.only(// buton içi yazı konumu
                                left: 15, right: 15, top: 16, bottom: 16),
                            child: Text(
                              "Add E-mail",
                              style:
                              TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                          color: Color(0xFF1c1a34),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFFffffff)),
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                          },
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
                        padding: const EdgeInsets.all(16), //bölümler arası mesafe ayarı
                        child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row( //mail adı ve alanını bi rowda ayarladık.
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        tumMailler[index]["mail_ad"] + " E-mail",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 16),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12), //work home konumu
                                      child: Container(
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.fromLTRB(12, 6, 12, 6),// work dış kalıp boyutu
                                          child: Text(
                                            tumMailler[index]["mail"],
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 15),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(20)),
                                            color: Color(0xFF5e50e4)),
                                      ),
                                    ),
                                  ],
                                ),
                                Row( //kilit ve mail adresini berabar konumlandırdık.
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 12), //kilit konumu
                                      child: Container(
                                        child: tumMailler[index]["kilit"] == true
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
                                        tumMailler[index]["mail_add"],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    )],
                                ),
                              ],
                            )),
                      ),
                      secondaryActions: <Widget>[
                        IconSlideAction( //sola sürükleyince
                          color: Colors.blueAccent,
                          foregroundColor: Colors.white,
                          icon: Icons.send,
                          onTap: () {
                            UrlLauncher.launch(
                                'mailto:${tumMailler[index]["mail_add"].toString()}');
                          },
                        )
                      ],
                    ),
                    Container(//bölümler arası çizgi ayarı
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
    var gelenJsons = await DefaultAssetBundle.of(context) //json içindeki veriyi tutuyoruz.
        .loadString("assets/data/mailler.json");

    List bilgiList = json.decode(gelenJsons.toString()); //jsondan aldığım bilgiyi liste formatına geçirdik.
    return bilgiList;
  }
}