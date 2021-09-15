
import 'package:architechrure/controller/home_controller.dart';
import 'package:architechrure/model/post_model.dart';
import 'package:architechrure/pages/update_page.dart';
import 'package:architechrure/services/http_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import 'CREATE_PAGE.dart';


class HomePage extends StatefulWidget {
  static final String id = "home_page";


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

final _controller=Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.apiPostList ();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX"),
      ),
      body: Obx(
          ()=>Stack(
            children: [
              ListView.builder(
                itemCount: _controller.items.length,
                itemBuilder: (ctx, index) {
                  return itemList (_controller.items[index]);
                },
              ),
              _controller.isLoading() ? Center (
                child: CircularProgressIndicator(),
              ) : SizedBox.shrink(),

            ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: (){
          _controller.apiCreatePost(context);
        },
      ),

    );
  }



  Widget itemList (Post post) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title.toUpperCase(), style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),),
            SizedBox(height: 5,),
            Text(post.body, style: TextStyle(color: Colors.blueGrey),),
          ],
        ),
      ),
      actions: [
        IconSlideAction(
          caption:  "Update",
          color: Colors.indigo,
          icon: Icons.edit,
          onTap: (){
            _controller.apiUpdatePost(context,post);
          },
        ),
      ],
      secondaryActions: [
        IconSlideAction(
          caption: "Delete",
          color: Colors.red,
          icon: Icons.delete,
          onTap: (){
            _controller.apiPostDelete(post);
          },
        ),
      ],
    );
  }
}
