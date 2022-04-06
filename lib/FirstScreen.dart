import 'package:flutter/material.dart';
import 'package:flutter_app/AddPost.dart';
import 'package:flutter_app/Likes.dart';
import 'package:flutter_app/Profile.dart';
import 'package:flutter_app/Rebloc/EventClass.dart';
import 'package:flutter_app/Rebloc/Loading.dart';
import 'package:flutter_app/Rebloc/NewRepository.dart';
import 'package:flutter_app/Rebloc/StateClass.dart';
import 'package:flutter_app/Rebloc/error.dart';
import 'package:flutter_app/Search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'Rebloc/ModelClass.dart';
import 'Rebloc/NewBloc.dart';

class FirstScreen extends StatefulWidget {
  @override
  FirstScreenState createState() => FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> {
  var bloc = BlocClass(repository: ScndRepositoryImpl())..add(SubEventClass());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider<BlocClass>(create: (context) => bloc)],
        child: BlocBuilder<BlocClass, StateClass>(builder: (context, state) {
          if (state is InitialState) {
            return ShimmerEffect();
          } else if (state is LoadingState) {
            return ShimmerEffect();
          } else if (state is LoadedState) {
            return BuildList(state.records);
          } else if (state is ErrorState) {
            return Builderror();
          } else {
            return Container();
          }
        }));
  }

  Widget BuildList(List<Records> records) {
    return MaterialApp(
      home: Scaffold(
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
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Divider(),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      height: 110,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: records == null ? 0 : records.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(70),
                                    border: Border.all(
                                      width: 3,
                                      color: Color(0xFF8e44ad),
                                    ),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(
                                      2,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(70),
                                      child: records[index].image == ""
                                          ? Text("No Image")
                                          : Image(
                                              image: NetworkImage(
                                                  records[index].image),
                                              width: 70,
                                              height: 70,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(records[index].name),
                              ],
                            );
                          })),

                  // posts
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: records == null ? 0 : records.length,
                      itemBuilder: (ctx, i) {
                        return Container(
                          color: Colors.white,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(40),
                                          child: records[i].image == ""
                                              ? Text("No Image")
                                              : Image(
                                                  image: NetworkImage(
                                                      records[i].image),
                                                  width: 40,
                                                  height: 40,
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(records[i].name),
                                      ],
                                    ),
                                    IconButton(
                                      icon: Icon(SimpleLineIcons.options),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),

                              records[i].post == ""
                                  ? Text("No Image")
                                  : FadeInImage(
                                      image: NetworkImage(records[i].post),
                                      placeholder: AssetImage(
                                          "assets/images/Insta_logo.png"),
                                      width: MediaQuery.of(context).size.width,
                                    ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(FontAwesome.heart_o),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(FontAwesome.comment_o),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(FontAwesome.send_o),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(FontAwesome.bookmark_o),
                                  ),
                                ],
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 14,
                                ),
                                child: RichText(
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Liked By ",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: "Sigmund,",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: " Yessenia,",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: " Dayana",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: " and",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: " 1263 others",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // caption
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 5,
                                ),
                                child: RichText(
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: records[i].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: " ${records[i].name}",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // post date
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 14,
                                ),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "November 2021",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  @override
  BottomState createState() => BottomState();
}

class BottomState extends State<BottomNavigation> {
  int currentindex = 0;

  final screens = [
    FirstScreen(),
    Search(),
    AddPost(),
    likes(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentindex],
      bottomNavigationBar: SnakeNavigationBar.color(
        currentIndex: currentindex,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Foundation.home,
                color: Colors.black,
              ),
              label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Feather.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Feather.plus_square), label: 'Upload'),
          BottomNavigationBarItem(icon: Icon(Feather.heart), label: 'Likes'),
          BottomNavigationBarItem(icon: Icon(Feather.user), label: 'Account')
        ],
      ),
    );
  }
}
