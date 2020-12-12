import 'package:flutter/material.dart';

class Snakes extends StatefulWidget {
  @override
  _SnakesState createState() => _SnakesState();
}

class _SnakesState extends State<Snakes> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Snakes"),
          backgroundColor: Colors.tealAccent[700],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(child: Text("Venomous",style: TextStyle(fontSize: 16),),),
              Tab(child: Text("Non-Venomous",style: TextStyle(fontSize: 16)),),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              padding: EdgeInsets.all(10),
              children: [
                ListTile(
                  onTap: (){
                    Navigator.pushNamed(context, "/details");
                  },
                  contentPadding: EdgeInsets.all(10),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network("https://picstatio.com/large/fhplbp/king-cobra-snake-wallpaper.jpg",fit: BoxFit.cover,height: 200,width: 80,),
                  ) ,
                  title: Text("King Cobra"),
                  subtitle: Text("Ophiophagus hannah"),
                ),
              ],
            ),
            ListView(
              padding: EdgeInsets.all(10),
              children: [
                ListTile(
                  onTap: (){
                    Navigator.pushNamed(context, "/details");
                  },
                  contentPadding: EdgeInsets.all(10),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network("https://rahulalvares.com/wp-content/uploads/2014/02/6O4A7885.jpg",fit: BoxFit.cover,height: 200,width: 80,),
                  ) ,
                  title: Text("Indian Rock Python"),
                  subtitle: Text("Python molurus"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
