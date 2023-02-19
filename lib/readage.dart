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


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar(title: Text("Love Shayari"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],),

        body:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PageView.builder(
                // controller: Paqe,
                    scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {

                    setState(() {

                       widget.r=value;
                       // ShrinkWrap:true ;
                     });
                    // ShrinkWrap:true ;
                  },

                  itemCount:list.length,
                  itemBuilder: (context, index) {
                    return  Container(

                      margin: EdgeInsets.all(10),

                      alignment: Alignment.center,
                      // clipBehavior: Clip.antiAlias,
                      width: 490,
                      height: 300,
                      color: Colors.red,
                      child: SingleChildScrollView(child: Text(
                          "${config.emoji[widget.r+10]} \n${widget.shayarlist[widget.r]}\n${config.emoji[widget.r+3]}", textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30,))),
                    );
                  },
                ),

                Spacer(),
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
                              return editipage("${widget.shayarlist}");
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
  ),
    );
  }
}


