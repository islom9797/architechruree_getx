import 'package:architechrure/model/post_model.dart';
import 'package:architechrure/services/http_request.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class UpdateController extends GetxController{
  var isLoading = false.obs;
  var titleController = TextEditingController().obs;
  var bodyController = TextEditingController().obs;
  Post oldPost;

  getOldPost(Post post) {

      oldPost =post;
      titleController.value.text = oldPost.title;
      bodyController.value.text = oldPost.body;

  }

  apiCreatePost() async{
    isLoading( true );

    String title = titleController.value.text.trim().toString();
    String body = bodyController.value.text.trim().toString();
    Post post = Post(title: title, body: body, userId: oldPost.userId, id: oldPost.id);

    var response = await Network.PUT(Network.API_UPDATE + oldPost.id.toString(), Network.paramsUpdate(post));
    print(response);
    isLoading( false );
  }
}