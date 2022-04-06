import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerEffect extends StatefulWidget {
  @override
  _LoadingListPageState createState() => _LoadingListPageState();
}

class _LoadingListPageState extends State<ShimmerEffect> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFEEEEEE),
        brightness: Brightness.light,
        title: Text("Instagram",
            style: GoogleFonts.pacifico(
                textStyle: TextStyle(color: Colors.black))),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Feather.plus_square,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesome.send,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Shimmer.fromColors(
        baseColor: Color.fromRGBO(224, 224, 224, 10),
        highlightColor: Colors.grey,
        enabled: true,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(
                vertical: 10,
              ),
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, __) => Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                itemCount: 15,
              ),
            ),
            SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                child:Container(
                  child: ListView.builder(
                  itemBuilder: (_, __) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 30,right: 30),
                          width: double.infinity,
                          height: 200.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  itemCount: 15,
                ),
              ),
              ),
            )
          ],
        ),

      ),
    );
  }
}
