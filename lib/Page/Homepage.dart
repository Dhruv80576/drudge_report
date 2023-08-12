import 'dart:ffi';
import 'package:drudge_report/Api/Api_service.dart';
import 'package:drudge_report/Api/News_model.dart';
import 'package:drudge_report/Page/News_page.dart';
import 'package:flutter/material.dart';
import 'Search_Delegate.dart';


List<News_model> a = [];
List<News_model> b = [];
List<News_model> c = [];
List<News_model> d = [];
List<News_model> e = [];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String breaking_news = "";
  int count_break = 10;
  int count_buss = 10;
  int count_finance = 10;
  int count_tech = 10;
  int count_poli = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  void getdata() async {
    a = (await Api_service(
            "https://newsapi.org/v2/top-headlines?country=in&apiKey=22490a09367c47d1b6b405da4c2ee1c9",
            '')
        .getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    b = (await Api_service(
            "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=22490a09367c47d1b6b405da4c2ee1c9",
            '')
        .getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));

    c = (await Api_service(
            "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=22490a09367c47d1b6b405da4c2ee1c9",
            '')
        .getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));

    d = (await Api_service(
            'https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=22490a09367c47d1b6b405da4c2ee1c9',
            '')
        .getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));

    e = (await Api_service(
            'https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=22490a09367c47d1b6b405da4c2ee1c9',
            '')
        .getUsers())!;

    breaking_news = a!.elementAt(0).title;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  Widget build(BuildContext context) {
    return a.length == 0 ||
            b.length == 0 ||
            c.length == 0 ||
            d.length == 0 ||
            e.length == 0
        ? Container(
            child: Scaffold(
                body: Center(
                    child: Container(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator()))),
          )
        : (Scaffold(
            body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 25, 10, 10),
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Text(
                              "DRUDGE REPORT",
                              style: TextStyle(
                                fontFamily: 'main',
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                            Spacer(),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 10, 40),
                                child: GestureDetector(
                                  onTap: () {
                                    showSearch(
                                        context: context,
                                        delegate: Search_Delegate(get_title()));
                                  },
                                  child: Icon(
                                    Icons.search,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      (Container(
                        margin: EdgeInsets.fromLTRB(10, 100, 10, 10),
                        child: Text(
                          breaking_news,
                          maxLines: 3,
                          style: TextStyle(
                            overflow: TextOverflow.fade,
                            fontFamily: 'main',
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      )),
                    ],
                  ),
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 20, 10, 10),
                    child: Text(
                      "BREAKING NEWS",
                      style: TextStyle(
                        fontFamily: 'main',
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: 220,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return index == count_break
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  count_break += 10;
                                });
                              },
                              icon: Icon(Icons.more_horiz))
                          : GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Newspage(1, index),
                                    ));
                              },
                              child: Container(
                                width: 300,
                                child: Card(
                                  child: Column(children: [
                                    a!.elementAt(index).img !=
                                            'asset/image1.jpg'
                                        ? Image.network(
                                            a!.elementAt(index).img,
                                            width: 300,
                                            height: 150,
                                          )
                                        : Image.asset(
                                            'asset/image1.jpg',
                                            width: 300,
                                            height: 150,
                                          ),
                                    Text(
                                      a!.elementAt(index).title,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 18,
                                          overflow: TextOverflow.fade),
                                    ),
                                    IconButton(
                                        onPressed: () {

                                        },
                                        icon: Icon(Icons.share))
                                  ]),
                                ),
                              ),
                            );
                    },
                    itemCount: a == null ? 1 : count_break + 1,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 20, 10, 10),
                    child: Text(
                      "Business",
                      style: TextStyle(
                        fontFamily: 'main',
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: 220,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return index == count_buss
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  count_buss += 10;
                                });
                              },
                              icon: Icon(Icons.more_horiz))
                          : GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Newspage(2, index),
                                    ));
                              },
                              child: Container(
                                width: 300,
                                child: Card(
                                  child: Column(children: [
                                    b!.elementAt(index).img !=
                                            'asset/image1.jpg'
                                        ? Image.network(
                                            b!.elementAt(index).img,
                                            width: 300,
                                            height: 150,
                                          )
                                        : Image.asset(
                                            'asset/image1.jpg',
                                            width: 300,
                                            height: 150,
                                          ),
                                    Text(
                                      b!.elementAt(index).title,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 18,
                                          overflow: TextOverflow.fade),
                                    ),
                                  ]),
                                ),
                              ),
                            );
                    },
                    itemCount: b == null ? 1 : count_buss + 1,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 20, 10, 10),
                    child: Text(
                      "Sports",
                      style: TextStyle(
                        fontFamily: 'main',
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: 220,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return index == count_finance
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  count_finance += 10;
                                });
                              },
                              icon: Icon(Icons.more_horiz))
                          : GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Newspage(3, index),
                                    ));
                              },
                              child: Container(
                                width: 300,
                                child: Card(
                                  child: Column(children: [
                                    c!.elementAt(index).img !=
                                            'asset/image1.jpg'
                                        ? Image.network(
                                            c!.elementAt(index).img,
                                            width: 300,
                                            height: 150,
                                          )
                                        : Image.asset(
                                            'asset/image1.jpg',
                                            width: 300,
                                            height: 150,
                                          ),
                                    Text(
                                      c!.elementAt(index).title,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 18,
                                          overflow: TextOverflow.fade),
                                    ),
                                  ]),
                                ),
                              ),
                            );
                    },
                    itemCount: c == null ? 1 : count_finance + 1,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 20, 10, 10),
                    child: Text(
                      "Technologogy",
                      style: TextStyle(
                        fontFamily: 'main',
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: 220,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return index == count_tech
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  count_tech += 10;
                                });
                              },
                              icon: Icon(Icons.more_horiz))
                          : GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Newspage(4, index),
                                    ));
                              },
                              child: Container(
                                width: 300,
                                child: Card(
                                  child: Column(children: [
                                    d!.elementAt(index).img !=
                                            'asset/image1.jpg'
                                        ? Image.network(
                                            d!.elementAt(index).img,
                                            width: 300,
                                            height: 150,
                                          )
                                        : Image.asset(
                                            'asset/image1.jpg',
                                            width: 300,
                                            height: 150,
                                          ),
                                    Text(
                                      d!.elementAt(index).title,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 18,
                                          overflow: TextOverflow.fade),
                                    ),
                                  ]),
                                ),
                              ),
                            );
                    },
                    itemCount: d == null ? 1 : count_tech + 1,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 20, 10, 10),
                    child: Text(
                      "ENTERTAINTMENT",
                      style: TextStyle(
                        fontFamily: 'main',
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: 220,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return index == count_poli
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  count_poli += 10;
                                });
                              },
                              icon: Icon(Icons.more_horiz))
                          : GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Newspage(5, index),
                                    ));
                              },
                              child: Container(
                                width: 300,
                                child: Card(
                                  child: Column(children: [
                                    e!.elementAt(index).img !=
                                            'asset/image1.jpg'
                                        ? Image.network(
                                            e!.elementAt(index).img,
                                            width: 300,
                                            height: 150,
                                          )
                                        : Image.asset(
                                            'asset/image1.jpg',
                                            width: 300,
                                            height: 150,
                                          ),
                                    Text(
                                      e!.elementAt(index).title,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 18,
                                          overflow: TextOverflow.fade),
                                    ),
                                  ]),
                                ),
                              ),
                            );
                    },
                    itemCount: e == null ? 1 : count_poli + 1,
                  ),
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(15, 20, 10, 10),
                      child: Text(
                        "Instagram",
                        style: TextStyle(
                          fontFamily: 'main',
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )));
  }

  List<String> get_title() {
    List<String> temp = [];
    for (var i in a) {
      temp.add(i.title);
    }
    return temp;
  }
}
