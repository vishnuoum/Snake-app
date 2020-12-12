import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'file:///D:/flutter_projects/snake_app/lib/screens/mainScreen.dart';
import 'package:snake_app/screens/firstaidScreen.dart';
import 'package:snake_app/screens/scanScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentSelected=0;
  bool centreTitle=false;
  String title="";
  Color titleColor=Colors.black,bgColor=Colors.white;
  void onItemTapped(int index){
    print(index);
    setState(() {
      currentSelected=index;
      title= index==0?"":index==1?"Scan":"First Aid";
      if(index==2){
        centreTitle=true;
        titleColor=Colors.white;
        bgColor=Colors.tealAccent[700];
      }
      else{
        bgColor=Colors.white;
        titleColor=Colors.black;
      }
      centreTitle = index==2?true:false;
    });
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.tealAccent[700]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: centreTitle,
        backgroundColor: bgColor,
        elevation: 0,
        iconTheme: new IconThemeData(color: titleColor,),
        title: Text(title,style: TextStyle(color: titleColor),),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Help"),
              onTap: (){},
            ),
            ListTile(
              title: Text("Rate Us"),
              onTap: (){},
            ),
            ListTile(
              title: Text("Snake Park"),
              onTap: (){},
            ),
            ListTile(
              title: Text("Terms and Conditions"),
              onTap: (){},
            )
          ],
        ),
      ),
      body: currentSelected==0?MainScreen():currentSelected==1?ScanScreen():FirstAidScreen(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconSize: 30,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        fixedColor: Colors.tealAccent[700],
        onTap: onItemTapped,
        currentIndex: currentSelected,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: "Scan",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital),
              label: "First Aid"
          ),
        ],
      ),
    );
  }
}
