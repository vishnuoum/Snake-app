import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.white,
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
          image: AssetImage("assets/bg1.png"),
          fit: BoxFit.cover,
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20,5,0,0),
            child: Text("Snake App",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
            child: Text("AI Snake Scan Powered by TFLite",),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Text("Popular",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
                  onTap: (){},
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                InkWell(
                  child: Text("View All",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  onTap: (){
                    Navigator.pushNamed(context, "/snakes");
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
              ],
            ),
          ),
          SizedBox(height: 40,),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 5),
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, "/details");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.height*0.5*0.75,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.network(
                        'https://live.staticflickr.com/7284/9499728853_266e91a403_b.jpg',
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 3,
                      margin: EdgeInsets.all(8),
                    ),

                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, "/details");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.height*0.5*0.75,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.network(
                        'https://picstatio.com/large/fhplbp/king-cobra-snake-wallpaper.jpg',
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 3,
                      margin: EdgeInsets.all(8),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, "/details");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.height*0.5*0.75,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.network(
                        'https://scontent-maa2-1.xx.fbcdn.net/v/t1.0-0/s640x640/65316196_10151072073054960_3095281573293981696_o.jpg?_nc_cat=108&_nc_sid=8bfeb9&_nc_ohc=WHSgDH_yDxwAX8MKRV7&_nc_ht=scontent-maa2-1.xx&tp=7&oh=e449d580bd3a925bf0136d28607f6086&oe=5FB15302',
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 3,
                      margin: EdgeInsets.all(8),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, "/details");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.height*0.5*0.75,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.network(
                        'https://rahulalvares.com/wp-content/uploads/2014/02/6O4A7885.jpg',
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 3,
                      margin: EdgeInsets.all(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50,)
        ],
      ),
    );
  }
}
