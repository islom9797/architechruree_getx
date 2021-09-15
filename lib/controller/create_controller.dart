import 'package:architechrure/model/post_model.dart';
import 'package:architechrure/services/http_request.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CreateController extends GetxController{
  var isLoading = false.obs;
  var titleController = TextEditingController().obs;
  var postController = TextEditingController().obs;

  apiCreatPost () async{
    isLoading ( true);

    String title = titleController.value.text.trim().toString();
    String body = postController.value.text.trim().toString();
    Post post = Post(title: title, body: body, userId: 1);
    var response =  await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    print (response);
    isLoading ( false);
    Get.back(result: response);
  }


}