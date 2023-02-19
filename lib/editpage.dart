import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class editipage extends StatefulWidget {
 
  String shay;
  editipage(this.shay);

  @override
  State<editipage> createState() => _editipageState();
}

class _editipageState extends State<editipage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Shayari"),
          centerTitle: true,
          actions:[Icon(
            Icons.share,
            size: 28,
          ),
            Padding(
              padding:  EdgeInsets.only(right: 10.0),
              child: PopupMenuButton(itemBuilder: (context) => [
                PopupMenuItem(child: Row(children: [
                  Text('Setting'),
                ],
                ),
                ),
                PopupMenuItem(child: Row(
                  children: [Text('Rate Us'),
                  ],
                ),
                ),
                PopupMenuItem(child: Row
                  (children: [Text('Share'),
                ],
                ),
                ),
                PopupMenuItem(child: Row(
                  children: [Text('More Apps 1'),
                  ],
                ),
                ),
                PopupMenuItem(child: Row(
                  children: [Text('More Apps 2'),
                  ],
                ),
                ),
              ],
                child: Icon(
                  Icons.more_vert,
                  size: 28,
                ),
              ),
            ),], shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )
        ),
          backgroundColor: Colors.green.shade400,
        ),
        body: Column(
             children: [
             SingleChildScrollView(
               child: Container(
               margin: EdgeInsets.all(10),
               alignment: Alignment.center,
               height: 300,
               width: 450,
               color: Colors.red,
               child: Text("${widget.shay}",textAlign: TextAlign.center,style: TextStyle(
                 fontSize: 30,
               ), ),
    ),
             ),

      Spacer(),
               Container(
                 height: 150,
                 width: double.infinity,
                 color: Colors.black54,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                              Container(
                                margin:EdgeInsets.fromLTRB(5, 0, 10, 1),
                                alignment: Alignment.center,
                                height: 30,
                                width: 20,
                                child: Image.asset("image/001.png"), ),
                         Container(
                           alignment: Alignment.center,

                           margin:EdgeInsets.fromLTRB(10, 0, 0, 1),
                           height: 30,
                           width: 20,

                           child: Image.asset("image/002.png"), ),
                         Container(

                         ),
                       ],
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,

                       children: [
                         Container(
                           alignment: Alignment.center,

                           margin: EdgeInsets.fromLTRB(10, 2, 10, 10),

                           height: 40,
                           width: 90,
                           color: Colors.red,
                           child: Text("Background",style: TextStyle(
                             color: Colors.white
                           )),
                         ),
                         Container(

                           alignment: Alignment.center,
                           margin: EdgeInsets.fromLTRB(10, 2, 10, 10),

                           height: 40,
                           width: 90,
                           color: Colors.red,
                           child: Text("Text Color",style: TextStyle(
                               color: Colors.white
                           )),
                         ),
                         Container(

                           alignment: Alignment.center,
                           margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                           height: 40,
                           width: 90,
                           color: Colors.red,
                           child: Text("Share",style: TextStyle(
                               color: Colors.white
                           )),
                         ),
                       ],
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Container(

                           alignment: Alignment.center,
                           margin: EdgeInsets.fromLTRB(10, 2, 10, 10),

                           height: 40,
                           width: 90,
                           color: Colors.red,
                           child: Text("Font",style: TextStyle(
    color: Colors.white
    )),
                         ),
                         Container(
                           alignment: Alignment.center,

                           margin: EdgeInsets.fromLTRB(10, 2, 10, 10),

                           height: 40,
                           width: 90,
                           color: Colors.red,
                           child: Text("Emoji",style: TextStyle(
    color: Colors.white
    )),
                         ),
                         Container(

                           alignment: Alignment.center,
                           margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                           height: 40,
                           width: 90,
                           color: Colors.red,
                           child: Text("Text Size",style: TextStyle(
    color: Colors.white
    )),
                         ),
                       ],
                     ),
                   ],
                 ),

               ),
    ],
    ),
      ),
    );
  }
}
