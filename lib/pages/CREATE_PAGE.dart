import 'package:architechrure/controller/create_controller.dart';
import 'package:architechrure/model/post_model.dart';
import 'package:architechrure/services/http_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatPage extends StatefulWidget {

  static final String id = "creat_page";

  @override
  _CreatPageState createState() => _CreatPageState();
}

class _CreatPageState extends State<CreatPage> {
final CreateController _createController=Get.put(CreateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Creat Post"),
        ),
        body: Obx(
            ()=>Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(

                    children: [
                      Container(
                        height: 40,
                        width: double.infinity,
                        child: TextField(
                          controller: _createController.titleController(),
                          decoration: InputDecoration(
                            labelText: "Title",
                            border: OutlineInputBorder (),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),

                      Container(
                        height: 100,
                        width: double.infinity,
                        child: TextField(
                          controller: _createController.postController(),
                          decoration: InputDecoration(
                            labelText: "Post",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      RaisedButton(
                        onPressed: (){
                          _createController.apiCreatPost ();
                        },
                        child: Text("Creat post"),
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
                _createController.isLoading() ? Center (
                  child: CircularProgressIndicator(),
                ) : SizedBox.shrink(),

              ],
            )
        )
    );
  }
}