import 'package:architechrure/controller/update_controller.dart';
import 'package:architechrure/model/post_model.dart';
import 'package:architechrure/services/http_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePage extends StatefulWidget {

  static final String id = "update_page";
  final Post post;

  UpdatePage({this.post});

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
final _controlle=Get.put(UpdateController());

  @override
  void initState() {
    super.initState();
    _controlle.getOldPost(widget.post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update post'),
      ),
      backgroundColor: Colors.white,
      body: Obx(
          ()=>Stack(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: _controlle.titleController(),
                      decoration: InputDecoration(
                        labelText: "Post Title",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(right: 15, left: 15),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: _controlle.bodyController(),
                      decoration: InputDecoration(
                        labelText: "Post Body",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(
                            right: 15, top: 15, bottom: 50, left: 15),
                      ),
                      maxLines: 7,
                    ),
                    SizedBox(height: 30,),
                    RaisedButton(
                      onPressed: () {
                        _controlle.apiCreatePost();
                      },
                      child: Text ("Update"),
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),

              _controlle.isLoading() ? Center(child: CircularProgressIndicator()) : SizedBox.shrink(),
            ],
          ),
      )
    );
  }
}