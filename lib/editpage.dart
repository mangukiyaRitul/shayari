
import 'dart:io';
import 'dart:math';

import 'package:external_path/external_path.dart';
import 'package:flutter/cupertino.dart';
  import 'package:share_plus/share_plus.dart';
  import 'package:flutter/material.dart';
  import 'package:shayari/config.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

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
    List<Color> gradient=[Color(0xff93BFCF),Color(0xffBDCDD6),Color(0xffEEE9DA)];
    List emojis =["😀 😃 😄 😁 😆 😅"," 😍 🥰 😘 😗 😙","🙄 😯 😦 😧 ","🤢 🤮 🤧 😷 🤒 🤕","😸 😹 😻 😼 😽","👋 🤚 🖐 ✋ 🖖","👐 🤲 🤝 🙏 ✍"," 🧒 👦 👩 🧑 ","👱 👱‍♂️ 👩‍🦳 🧑‍🦳 👨‍🦳","🐱 🐭 🐹 🐰 🦊 🐻 🐼 ","🐵 🙈 🙉 🙊 🐒 ","🐆 🦓 🦍 🦧 🦣 🐘","🦦 🦥 🐁 🐀 🐿 🦔 ","🎄 🌲 🌳 🌴"," 🌱 🌿 ☘️ 🍀 🎍 ","🌹 🥀 🌺 🌸 🌼"," 🌻 🌞 🌝 🌛 ","Without Emoji"];

    String emoji="😀 😃 😄 😁 😆 😅";

    // @override
    // void initState() {
    //   // TODO: implement initState
    //   super.initState();
    //   emoji=config.emoji[widget.i];
    // }
    WidgetsToImageController controller = WidgetsToImageController();

    String font="f1";
    double fontsize=30;
    bool Singalcolor=true;

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
                  WidgetsToImage(
                  controller: controller,
                    child: Container(

                    decoration: BoxDecoration(

                      color:Singalcolor?bgcolor:null,
                      gradient:Singalcolor?null:LinearGradient(colors: gradient),

                    ),

                      // margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      // height: 300,
                      // width: 450,
                      child: Text(
                        "$emoji\n${widget.shay}\n$emoji",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: fontsize,
                          fontFamily: "$font",
                          color: textcolor ,
                        ),
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
                       InkWell(
                         onTap: () {
                           showModalBottomSheet(
                             isScrollControlled: true,
                             context: context,
                             isDismissible: false,
                             // backgroundColor: ,
                             barrierColor: Colors.transparent,
                             builder: (context) {
                               return  Container(
                                     color: Colors.white24,
                                     height: 786,
                                     margin: EdgeInsets.all(5),
                                     // width: 50,
                                     child: GridView.builder(
                                       itemBuilder: (context, index) {
                                         return InkWell(
                                           onTap: () {
                                           setState(() {
                                             Singalcolor=false;
                                            gradient= config.gradient[index];
                                           });
                                           Navigator.pop(context);
                                         }, child: Container(
                                           alignment: Alignment.center,
                                           decoration: BoxDecoration(
                                             gradient: LinearGradient(
                                               colors: config.gradient[index],
                                             )
                                           ),
                                           child: Text("$emoji\nShayari\n$emoji",textAlign: TextAlign.center),
                                         ),
                                         );
                                       },
                                       gridDelegate:
                                       SliverGridDelegateWithFixedCrossAxisCount(
                                         crossAxisCount: 2,
                                         crossAxisSpacing: 5,
                                         mainAxisSpacing: 5,
                                       ),
                                       shrinkWrap: true,
                                       itemCount: config.gradient.length,
                                     ),
                                   );

                             },
                           );
                         },
                         child: Container(
                         margin: EdgeInsets.fromLTRB(5, 0, 10, 1),
                         alignment: Alignment.center,
                         height: 30,
                         width: 30,
                         child: Image.asset("image/001.png"),
                       ),),

                        InkWell(onTap: (){
                          int min=0;
                          int max=gradient.length;
                          setState(() {
                            Singalcolor=false;
                            int random=Random().nextInt(max-min)+min;
                              gradient=config.gradient[random];
                          });

                        },child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 1),
                          height: 30,
                          width: 30,
                          child: Image.asset("image/002.png"),
                        ),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Row(
                        //   children: [

                        //BGColor

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
                                                      Singalcolor=true;
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

                        // Text Color

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

                       // Share


                        InkWell(onTap: () async {
                          final bytes = await controller.capture();
                          var path = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DCIM);
                          DateTime now =DateTime.now();

                          print(now.hour.toString()+":"+ now.minute.toString()+":"+now.second.toString());
                           String imgname="IMG_${now.year}${now.month}${now.day}${now.hour}${now.minute}${now.second}.jpg";

                          // print("${path}");

                          Directory dir=Directory('$path/Ritul');
                          if(!dir.existsSync())
                            {
                              print("Dir Not avalable");
                              dir.createSync();
                            }
                          else{
                                 print("Dir avalable");
                          }
                          File f=File('${dir.path}/${imgname}');
                          if(!f.existsSync())
                            {
                              f.createSync();
                              f.writeAsBytesSync(bytes!);
                              Share.shareFiles(['${f.path}']);
                            }
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

                       // Font

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

                    // Emoji

                    InkWell(onTap: () {

                      showModalBottomSheet(barrierColor: Colors.transparent, context: context, builder:(context) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
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

                                      if(emojis[index]=="Without Emoji" )
                                        {
                                          emojis[index]="";
                                        }
                                      else
                                        {
                                          emoji= "${emojis[index]}";
                                        }

                                    });
                                  }, child:  Container(
                                    margin:EdgeInsets.all(10),
                                    alignment: Alignment.center,
                                    // height: 10,
                                    // width: 50,
                                    color: Colors.indigoAccent,
                                    child: Text("${emojis[index]}"),
                                  ),);
                                },

                                itemCount: config.emoji.length,),
                            ),
                          ),
                            InkWell( onTap: (){
                              Navigator.pop(context);
                            }, child: Container(
                              child: Image.asset("image/close.png",height:25,),
                            color: Colors.indigoAccent,
                            ),
                            ),
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

                        // Size

                        InkWell(onTap: () {

                          showModalBottomSheet(barrierColor: Colors.transparent, context: context, builder:(context) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                     height: 150,
                                    child: StatefulBuilder( builder:(context,setState1) {
                                      return Slider(
                                        onChanged: (value) {
                                          setState(() {
                                            setState1 ((){
                                              fontsize=value ;
                                              },);
                                            },
                                          );
                                        },
                                        min: 10,
                                        max: 60,
                                      value: fontsize,
                                      );
                                    },
                            ),
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
                            Text("Text Size", style: TextStyle(color: Colors.white)),
                          ),),
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
