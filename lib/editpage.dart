import 'package:flutter/cupertino.dart';
  import 'package:share_plus/share_plus.dart';
  import 'package:flutter/material.dart';
  import 'package:shayari/config.dart';

  class editipage extends StatefulWidget {
    String shay;
    int i;

    editipage(this.shay,this.i);


    @override
    State<editipage> createState() => _editipageState();
  }

  class _editipageState extends State<editipage> {

    Color bgcolor=Colors.pink;
    Color textcolor=Colors.black;
    List emojis =["😀 😃 😄 😁 😆 😅"," 😍 🥰 😘 😗 😙","🙄 😯 😦 😧 ","🤢 🤮 🤧 😷 🤒 🤕","😸 😹 😻 😼 😽","👋 🤚 🖐 ✋ 🖖","👐 🤲 🤝 🙏 ✍"," 🧒 👦 👩 🧑 ","👱 👱‍♂️ 👩‍🦳 🧑‍🦳 👨‍🦳","🐱 🐭 🐹 🐰 🦊 🐻 🐼 ","🐵 🙈 🙉 🙊 🐒 ","🐆 🦓 🦍 🦧 🦣 🐘","🦦 🦥 🐁 🐀 🐿 🦔 ","🎄 🌲 🌳 🌴"," 🌱 🌿 ☘️ 🍀 🎍 ","🌹 🥀 🌺 🌸 🌼"," 🌻 🌞 🌝 🌛 ",];

    String emoji="😀 😃 😄 😁 😆 😅";

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      emoji=config.emoji[widget.i];
    }

    String font="f1";
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Shayari"),
          centerTitle: true,
          actions: [
            Icon(
              Icons.share,
              size: 28,
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Text('Setting'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Text('Rate Us'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Text('Share'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Text('More Apps 1'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Text('More Apps 2'),
                      ],
                    ),
                  ),
                ],
                child: Icon(
                  Icons.more_vert,
                  size: 28,
                ),
              ),
            ),
          ],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  // bottomLeft: Radius.circular(30),
                  // bottomRight: Radius.circular(30),
                  )),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    // height: 300,
                    // width: 450,
                    color:  bgcolor,
                    child: Text(
                      "$emoji\n${widget.shay}\n$emoji",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "$font",
                        color: textcolor ,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                        margin: EdgeInsets.fromLTRB(5, 0, 10, 1),
                        alignment: Alignment.center,
                        height: 30,
                        width: 20,
                        child: Image.asset("image/001.png"),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 1),
                        height: 30,
                        width: 20,
                        child: Image.asset("image/002.png"),
                      ),
                      Container(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Row(
                      //   children: [

                              InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  // isDismissible: false,
                                  // backgroundColor: ,
                                  barrierColor: Colors.transparent,
                                  builder: (context) {
                                    return  Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [ Expanded(
                                        child: Container(
                                            color: Colors.white24,
                                            height: 150,
                                            // width: 50,
                                            child: GridView.builder(
                                              itemBuilder: (context, index) {
                                                return InkWell( onTap: () {
                                                  setState(() {
                                                    bgcolor= config.color[index];
                                                  });
                                                }, child: Container(
                                                  color: config.color[index],
                                                ), );
                                              },
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 8,
                                                crossAxisSpacing: 5,
                                                mainAxisSpacing: 5,
                                              ),
                                              shrinkWrap: true,
                                              itemCount: config.color.length,
                                            ),
                                          ),
                                      ),
                                       InkWell( onTap: (){
                                         Navigator.pop(context);
                                       }, child:  Image.asset("image/close.png",height:25,),),
                                    ],
                                    );
                                  },
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                                height: 40,
                                width: 90,
                                color: Colors.red,
                                child: Text("Background",
                                    style: TextStyle(color: Colors.white)),
                            ),
                          ),

                      //   ],
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            // isDismissible: false,
                            // backgroundColor: ,
                            barrierColor: Colors.transparent,
                            builder: (context) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children:[ Expanded(
                                  child: Container(
                                    color: Colors.white24,
                                    height: 150,
                                    // width: 50,
                                    child: GridView.builder(
                                      itemBuilder: (context, index) {
                                        return InkWell( onTap: () {
                                          setState(() {
                                            textcolor= config.color[index];
                                          });
                                        }, child: Container(
                                          color: config.color[index],
                                        ), );
                                      },
                                      gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 8,
                                        crossAxisSpacing: 5,
                                        mainAxisSpacing: 5,
                                      ),
                                      shrinkWrap: true,
                                      itemCount: config.color.length,
                                    ),
                                  ),
                                ),
                                  InkWell( onTap: (){
                                    Navigator.pop(context);
                                  }, child:  Image.asset("image/close.png",height:25,),),
                              ],
                              );
                            },
                          );
                        },  // ),
                       child:Container(
                     alignment: Alignment.center,
                     margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                     height: 40,
                     width: 90,
                     color: Colors.red,
                     child: Text("Text Color",
                         style: TextStyle(color: Colors.white)),
                   ),
                       ),
                     InkWell(onTap: () {

                       Share.share('${widget.shay}');
                     },child:  Container(
                       alignment: Alignment.center,
                       margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                       height: 40,
                       width: 90,
                       color: Colors.red,
                       child:
                       Text("Share", style: TextStyle(color: Colors.white)),
                     ),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     InkWell( onTap: () {
                       showModalBottomSheet(barrierColor: Colors.transparent, context: context, builder:(context) {
                         return Row(
                           crossAxisAlignment: CrossAxisAlignment.start,

                           children: [ Expanded(
                             child: Container(
                               // margin: EdgeInsets.fromLTRB(0, 25, 0, 5),
                               // color: Colors.indigoAccent,
                               // alignment: Alignment.center,
                               height: 150,
                               child: GridView.builder(
                                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 6,
                                   mainAxisSpacing: 10,
                                     crossAxisSpacing: 10,

                                   ),
                                   itemBuilder: (context, index) {
                                     return InkWell( onTap: () {
                                       setState(() {
                                         font= "${config.font[index]}";
                                       });
                                     }, child:  Container(
                                       alignment: Alignment.center,
                                       // height: 10,
                                       // width: 50,
                                       color: Colors.indigoAccent,
                                       child: Text("Shayari",
                                           style: TextStyle(
                                             fontFamily: "${config.font[index]}",
                                           )),

                                     ),);
                                   },
                               itemCount: config.font.length,),
                             ),
                           ),
                             InkWell( onTap: (){
                               Navigator.pop(context);
                             }, child:  Image.asset("image/close.png",height:25,),),
                         ],
                         ) ;
                       },);
                     },
                      child:  Container(
                       alignment: Alignment.center,
                       margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                       height: 40,
                       width: 90,
                       color: Colors.red,
                       child:
                       Text("Font", style: TextStyle(color: Colors.white)),
                     ), ),

                  InkWell(onTap: () {

                    showModalBottomSheet(barrierColor: Colors.transparent, context: context, builder:(context) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [ Expanded(
                          child: Container(
                            // margin: EdgeInsets.fromLTRB(0, 25, 0, 5),
                            color: Colors.indigoAccent,
                            // alignment: Alignment.center,
                            height: 150,
                            child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return Divider(color:  Colors.white, );
                                  },
                              itemBuilder: (context, index) {
                                return InkWell( onTap: () {
                                  setState(() {
                                    emoji= "${emojis[index]}";
                                  });
                                }, child:  Container(
                                  margin:EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  // height: 10,
                                  // width: 50,
                                  color: Colors.indigoAccent,
                                  child: Text("${config.emoji[index]}"),
                                ),);
                              },

                              itemCount: config.emoji.length,),
                          ),
                        ),
                          InkWell( onTap: (){
                            Navigator.pop(context);
                          }, child:  Image.asset("image/close.png",height:25,),),
                      ],
                      ) ;
                    },);

                  },
                  child:     Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                    height: 40,
                    width: 90,
                    color: Colors.red,
                    child:
                    Text("Emoji", style: TextStyle(color: Colors.white)),
                  ),),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                        height: 40,
                        width: 90,
                        color: Colors.red,
                        child: Text("Text Size",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
