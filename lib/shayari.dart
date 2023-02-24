import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shayari/config.dart';
import 'package:shayari/shayarilist.dart';

class shayari extends StatefulWidget {
  const shayari({Key? key}) : super(key: key);

  @override
  State<shayari> createState() => _shayariState();
}

class _shayariState extends State<shayari> {

        List list=List.filled(config.cat.length, false);

  @override
  Widget build(BuildContext context) {
    return
     Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(title: Text("Love Shayari"), backgroundColor: Colors.green, actions: [ IconButton(onPressed: (){}, icon: Icon(Icons.share)),IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))],),
          body: Container(
            margin: EdgeInsets.all(10),
            child: ListView.separated(

                itemBuilder: (context, index) {

                  return GestureDetector(
                   onTapDown:(details) {
                     setState(() {
                       list[index]=true;
                     });
                   },
                    onTap: () {
                      setState(() {
                        list[index]=true;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return shayarilist(index);
                      },));
                    },
                    onTapUp: (details) {
                      setState(() {
                        list[index]=false;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return shayarilist(index);
                      },));
                      },

                   child: ListTile(
                      selectedTileColor: Colors.red,
                        // selectedColor: Colors.red,
                        selected: list[index],
                      leading: Image.asset("image/${config.img[index]}"),
                      title: Text("${config.cat[index]}"),
                      // trailing: Icon(CupertinoIcons.right_chevron),
                    ),
                  );
                }, separatorBuilder: (context, index) {
              return Divider(thickness: 5,height: 10,color: Colors.grey.shade200,);
            }, itemCount:config.img.length ),
          ),
        );
  }
}
