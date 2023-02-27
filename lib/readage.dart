import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shayari/config.dart';
import 'package:shayari/editpage.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';
class readpage extends StatefulWidget {

  List shayarlist;
  int r;
  String emojis;
  readpage(this.shayarlist,this.r,this.emojis);

   @override
  State<readpage> createState() => _readpageState();
}
class _readpageState extends State<readpage> {

  List list = [];
  PageController? page;
  Color bgcolor=Colors.pink;
  List<Color> gradient=[Color(0xff93BFCF),Color(0xffBDCDD6),Color(0xffEEE9DA)];
  bool Singalcolor=true;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page=PageController(
      initialPage: widget.r,
    );
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(title: Text("Love Shayari"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],),

        body:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
        Container(
          child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,

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
                                      return  Expanded(
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          color: Colors.white24,
                                          height: 786,
                                          // width: 50,
                                          child: GridView.builder(
                                            itemBuilder: (context, index) {
                                              return InkWell( onTap: () {
                                                setState(() {
                                                  Singalcolor=false;
                                                  gradient= config.gradient[index];
                                                });
                                                Navigator.pop(context);
                                              }, child: Container(
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: config.gradient[index],
                                                    )
                                                ),
                                              ), );
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
                     Container(
                        margin: EdgeInsets.all(3),

                        // margin: EdgeInsets.fromLTRB(0, top, right, bottom),
                        height: 20,
                        width: 40,
                        alignment: Alignment.center,
                        child: Text("${widget.r + 1 }/${widget.shayarlist.length}"),
                      ),
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
        ),
                // PageView.builder(
                // // controller: Paqe,
                //     scrollDirection: Axis.horizontal,
                //
                //   onPageChanged: (value) {
                //     setState(() {
                //        widget.r=value;
                //        // ShrinkWrap:true ;
                //      });
                //     // ShrinkWrap:true ;
                //   },
                //   itemCount:list.length,
                //   itemBuilder: (context, index) {
                //
                //     return
                Expanded(
                    child: PageView.builder(
                      controller: page,
                      onPageChanged: (value) {
                        setState(() {
                          widget.r=value;
                        });
                      },
                      itemCount:widget.shayarlist.length,
                      itemBuilder: (context, index) {
                        return  ListView(
                          children: [
                            Container(
                              decoration: BoxDecoration(

                                color:Singalcolor?bgcolor:null,
                                gradient:Singalcolor?null:LinearGradient(colors: gradient),

                              ),
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "${config.emoji[widget.r]} \n ${widget.shayarlist[widget.r]}\n ${config.emoji[widget.r+1]}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        );
                      },)
                ),
                //   },
                // ),


                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.green,
                  height: 70,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: IconButton(onPressed: () async {
                          await Clipboard.setData(ClipboardData(text:"${config.emoji[widget.r+10]} \n${widget.shayarlist[widget.r]}\n${config.emoji[widget.r+3]}"));
                        },
                            icon: Icon(Icons.copy, color: Colors.white,)),
                      ),
                      Container(
                        child: IconButton(onPressed: () {
                          setState(() {
                            if (widget.r > 0) {
                                  widget.r--;

                            }
                          });
                        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
                      ),
                      Container(
                        child: IconButton(onPressed: () {
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {

                              return editipage("${widget.shayarlist[widget.r]}",widget.r);
                            },));

                          });
                        }, icon: Icon(Icons.edit, color: Colors.white)),
                      ),
                      Container(
                        child: IconButton(onPressed: () {
                          setState(() {
                            if (widget.r < widget.shayarlist.length - 1) {
                              widget.r++;
                            }
                          });
                        },
                            icon: Icon(
                                Icons.arrow_forward_ios, color: Colors.white)),
                      ),

                      IconButton(onPressed: () {
                        Share.share('${config.emoji[widget.r+10]} \n${widget.shayarlist[widget.r]}\n${config.emoji[widget.r+3]}');
                      },
                          icon: Icon(Icons.share, color: Colors.white)),
                    ],
                  ),
                ),
              ],
    ),
  );
  }
}



