import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiddendrawer/drawer.dart';

import 'theme.dart';

class MainPage extends DrawerContent {
  MainPage({Key key, this.title});
  final String title;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  child: Material(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: widget.onMenuPressed,
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: Container(
                margin: EdgeInsets.only(top:2, right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('الأكثر طلباً هذا الأسبوع',
                          style: TextStyle(
                              fontFamily: 'varela',
                              fontSize: 17.0,
                              color: Color(0xFF473D3A)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:15.0),
                          child: Text('مشاهدة الكل',
                            style: TextStyle(
                                fontFamily: 'varela',
                                fontSize: 15.0,
                                color: Color(0xFFCEC7C4)),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        height:300.0,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              _ListCard(
                                  '',
                                  '',
                                  '',
                                  false
                              ),
                              _ListCard(

                                  '',
                                  '',
                                  '',
                                  false
                              )
                            ]
                        )
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(widget.title),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
_ListCard(String coffeeName,  String description, String price, bool isFavorite) {
  return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Container(
          height: 300.0,
          width: 230.0,
          child: Column(
            children: <Widget>[
              Stack(
                  children: [
                    Container(
                        height: 260.0
                    ),
                    Positioned(
                        top: 0.0,
                        child: Container(
                            padding: EdgeInsets.only(left: 10.0, right: 20.0),
                            height: 260.0,
                            width: 225.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: HexColor("2E8B57")
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 60.0,
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    coffeeName,
                                    style: TextStyle(
                                        fontFamily: 'varela',
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    description,
                                    style: TextStyle(
                                        fontFamily: 'nunito',
                                        fontSize: 14.0,
                                        // fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        price,
                                        style: TextStyle(
                                            fontFamily: 'varela',
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold,
                                            color:HexColor("D8BFD8")),
                                      ),
                                      Container(
                                          height: 40.0,
                                          width: 40.0,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20.0),
                                              color: Colors.white
                                          ),
                                          child: Center(
                                              child: Icon(Icons.favorite,
                                                  color: isFavorite ? Colors.red: Colors.grey,
                                                  size: 15.0
                                              )
                                          )
                                      )
                                    ],
                                  )
                                ]
                            )
                        )
                    ),

                  ]
              ),
             // SizedBox(height: 10.0),
             // InkWell()
            ],
          )
      )
  );
}
class MainWidget extends StatefulWidget {
  MainWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  HiddenDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = HiddenDrawerController(
      initialPage: MainPage(
        title: 'main',
      ),
      items: [
        DrawerItem(
          text: Text('الرئيسية', style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.home, color: Colors.white),
          page: MainPage(
            title: 'Home',
          ),
        ),
        DrawerItem(
          text: Text(
            'الصور',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.photo_album, color: Colors.white),
          page: MainPage(
            title: 'Gallery',
          ),
        ),
        DrawerItem(
          text: Text(
            'المفضلة',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.favorite, color: Colors.white),
          page: MainPage(
            title: 'Favorites',
          ),
        ),
        DrawerItem(
          text: Text(
            'الإشعارات',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.notifications, color: Colors.white),
          page: MainPage(
            title: 'Notification',
          ),
        ),
        DrawerItem(
          text: Text(
            'التقويم',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.insert_invitation, color: Colors.white),
          page: MainPage(
            title: 'invite',
          ),
        ),
        DrawerItem(
          text: Text(
            'الإعدادات',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.settings, color: Colors.white),
          page: MainPage(
            title: 'SETTINGS',
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HiddenDrawer(
        controller: _drawerController,
        header: Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 5)),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                width: MediaQuery.of(context).size.width * 0.6,
                child: ClipOval(
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'smaher',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [HexColor("2E8B57"), HexColor("2E8B57"), Colors.white],
            // tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}
