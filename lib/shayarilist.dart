import 'package:flutter/material.dart';
import 'package:shayari/config.dart';
import 'package:shayari/readage.dart';

class shayarilist extends StatefulWidget {

  int pos;
  shayarilist(this.pos);

  @override
  State<shayarilist> createState() => _shayarilistState();
}

class _shayarilistState extends State<shayarilist> {
  List<String> list = [];

  void initState() {
    super.initState();

    if (widget.pos == 0) {
      list = config.bestwishes;
    }
    else if (widget.pos == 1) {
      list = config.husband;
    }
    else if (widget.pos == 2) {
      list = config.child;
    } else if (widget.pos == 3) {
      list = config.god;
    } else if (widget.pos == 4) {
      list = config.motivetional;
    }
    else if (widget.pos == 5) {
      list = config.kanjoos;
    } else if (widget.pos == 6) {
      list = config.husband;
    } else if (widget.pos == 7) {
      list = config.husband;
    } else if (widget.pos == 8) {
      list = config.husband;
    } else if (widget.pos == 9) {
      list = config.husband;
    } else if (widget.pos == 10) {
      list = config.husband;
    } else if (widget.pos == 11) {
      list = config.husband;
    } else if (widget.pos == 12) {
      list = config.husband;
    } else if (widget.pos == 13) {
      list = config.husband;
    } else if (widget.pos == 14) {
      list = config.husband;
    } else if (widget.pos == 15) {
      list = config.husband;
    }
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold( appBar: AppBar(title: Text("Love Shayari"), backgroundColor: Colors.green, actions: [  IconButton(onPressed: (){},  icon: Icon(Icons.share)),IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))],),

        body: ListView.builder(itemCount: list.length,itemBuilder: (context, index) {
            return Container(
               margin: EdgeInsets.all(5),
              child: ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:  (context) {
                    return readpage(list,index,"${config.emoji}");
                  },));
                },
                leading: Image.asset("image/${config.img[widget.pos]}"),
                title: Text("${config.emoji[index]}\n${list[index].substring(0,30)  }"),

              ),
            );
          },

          ),

      );
  }
}