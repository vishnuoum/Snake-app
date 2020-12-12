
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Details extends StatefulWidget {

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  String title,scientificName,awesomeStory,habitat,appearance,diet,breeding,longetivity;

  @override
  void initState(){
    super.initState();

    initializeDetails();
  }

  void initializeDetails() async{
    setState(() {
      title="Indian Rock Python";
      scientificName="Python molurus";
      awesomeStory="Python molurus is a large, nonvenomous python species native to tropical and subtropical regions of the Indian subcontinent and Southeast Asia. It is known by the common names Indian python, black-tailed python, Indian rock python, and Asian rock python.";
      habitat="It lives in a wide range of habitats, including grasslands, swamps, marshes, rocky foothills, woodlands, open forest, and river valleys. It needs a permanent source of water.[11] It hides in abandoned mammal burrows, hollow trees, dense water reeds, and mangrove thickets.";
      appearance="Body weight:upto 91 Kg. Body length: about 6.5 m. They are marked with rectangular mosaic pattern that runs the full length of the animal.";
      diet="Feeds mainly on frogs, tadpoles and fishes";
      breeding="The mating season occurs during cold season in December, January, February. They attain sexual maturity at 2 to 3 years. Clutch size ranges from 8 to 100 eggs. Incubation period is about 58 to 90 days";
      longetivity="16 years";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
            Positioned(
              top: 0,
              child: Container(
                height: MediaQuery.of(context).size.height*0.46,
                child: Image(
                  image: NetworkImage("https://rahulalvares.com/wp-content/uploads/2014/02/6O4A7885.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height*0.46-15,
                height: MediaQuery.of(context).size.height*0.54+15,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)
                    )
                  ),
                  child:
                  Column(
                    children: [
                      Expanded(
                        child: GlowingOverscrollIndicator(
                          color: Colors.tealAccent,
                          axisDirection: AxisDirection.down,
                          child: ListView(
                            padding: EdgeInsets.fromLTRB(20,20,20,0),
                            children: [
                              Text(title,style: TextStyle(decoration: TextDecoration.none,color: Colors.black,fontSize: 25),),
                              Text(scientificName,style: TextStyle(decoration: TextDecoration.none,color: Colors.grey[500],fontSize: 15),),
                              SizedBox(height: 25,),
                              Text("Awesome Story",style: TextStyle(decoration: TextDecoration.none,color: Colors.black,fontSize: 20),),
                              SizedBox(height: 10,),
                              Text(awesomeStory,style: TextStyle(decoration: TextDecoration.none,color: Colors.grey,fontSize: 15,),textAlign: TextAlign.justify,),
                              SizedBox(height: 25,),
                              Text("Habitat",style: TextStyle(decoration: TextDecoration.none,color: Colors.black,fontSize: 20),),
                              SizedBox(height: 10,),
                              Text(habitat,style: TextStyle(decoration: TextDecoration.none,color: Colors.grey,fontSize: 15),textAlign: TextAlign.justify,),
                              SizedBox(height: 25,),
                              Text("Appearance",style: TextStyle(decoration: TextDecoration.none,color: Colors.black,fontSize: 20),),
                              SizedBox(height: 10,),
                              Text(appearance,style: TextStyle(decoration: TextDecoration.none,color: Colors.grey,fontSize: 15),textAlign: TextAlign.justify,),
                              SizedBox(height: 25,),
                              Text("Diet",style: TextStyle(decoration: TextDecoration.none,color: Colors.black,fontSize: 20),),
                              SizedBox(height: 10,),
                              Text(diet,style: TextStyle(decoration: TextDecoration.none,color: Colors.grey,fontSize: 15),textAlign: TextAlign.justify,),
                              SizedBox(height: 25,),
                              Text("Breeding",style: TextStyle(decoration: TextDecoration.none,color: Colors.black,fontSize: 20),),
                              SizedBox(height: 10,),
                              Text(breeding,style: TextStyle(decoration: TextDecoration.none,color: Colors.grey,fontSize: 15),textAlign: TextAlign.justify,),
                              SizedBox(height: 25,),
                              Text("Longetivity",style: TextStyle(decoration: TextDecoration.none,color: Colors.black,fontSize: 20),),
                              SizedBox(height: 10,),
                              Text(longetivity,style: TextStyle(decoration: TextDecoration.none,color: Colors.grey,fontSize: 15),textAlign: TextAlign.justify,),


                            ],
                            
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical:8,horizontal: 20),
                        child: FlatButton(
                          height: 50,
                          minWidth: double.infinity,
                          color: Colors.tealAccent[700],
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                          ),
                          child: Text("KNOW MORE",style: TextStyle(fontSize: 15),),
                          onPressed: () async{
                            const url="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwialM2X8MDsAhU6yzgGHT8_BZoQmhMwIXoECCYQAg&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FPython_molurus&usg=AOvVaw0msN3vqdH4m5YhzzZT95C1";
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                      )
                    ],
                  )
                ),
            )
        ],
      ),
    );
  }
}
