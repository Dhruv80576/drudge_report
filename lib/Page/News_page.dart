import 'package:flutter/material.dart';

import 'Homepage.dart';

class Newspage extends StatelessWidget {
  int index;
  int news;

  Newspage(this.news, this.index);

  void update_info() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              news == 1
                  ? a!.elementAt(index).title
                  : news == 2
                      ? b!.elementAt(index).title
                      : news == 3
                          ? c!.elementAt(index).title
                          : d!.elementAt(index).title,
              style: TextStyle(
                fontFamily: 'main',
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          ),
          Center(
            child: Image.network(
              news == 1
                  ? a!.elementAt(index).img
                  : news == 2
                      ? b!.elementAt(index).img
                      : news == 3
                          ? c!.elementAt(index).img
                          : d!.elementAt(index).img,
            ),
          ),
          Text(news == 1
              ? a!.elementAt(index).time
              : news == 2
                  ? b!.elementAt(index).time
                  : news == 3
                      ? c!.elementAt(index).time
                      : d!.elementAt(index).time),
          Text(
            news == 1
                ? a!.elementAt(index).description
                : news == 2
                    ? b!.elementAt(index).description
                    : news == 3
                        ? c!.elementAt(index).description
                        : d!.elementAt(index).description,
          ),
          GestureDetector(
            onTap: () async {
              final Uri url = Uri.parse(news == 1
                  ? a!.elementAt(index).url
                  : news == 2
                      ? b!.elementAt(index).url
                      : news == 3
                          ? c!.elementAt(index).url
                          : d!.elementAt(index).url);
            },
            child: Text(
              news == 1
                  ? a!.elementAt(index).url
                  : news == 2
                      ? b!.elementAt(index).url
                      : news == 3
                          ? c!.elementAt(index).url
                          : d!.elementAt(index).url,
            ),
          )
        ],
      ),
    );
  }
}
