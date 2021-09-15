import 'package:architechrure/model/post_model.dart';
import 'package:architechrure/model/post_model.dart';
import 'package:architechrure/pages/CREATE_PAGE.dart';
import 'package:architechrure/pages/update_page.dart';
import 'package:architechrure/services/http_request.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController{
  var items = new List().obs;
  var isLoading=false.obs;

  Future apiPostList () async {
    isLoading (true);
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null ) {
      items.value = Network.parsePostList(response);
    } else {
      items.value=new List();
    }
    isLoading( false );
  }

  Future apiCreatePost(BuildContext context) async{
   String result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreatPage()));
   items.add(Network.parsePost(result));
  }

  Future apiUpdatePost(BuildContext context,Post post) async{
   String result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdatePage(post: post,)));
   Post post2 = Network.parsePost(result);
   items[items.indexWhere((element) => element.id == post2.id)] = post2;
  }

  Future apiPostDelete(Post post) async {
    isLoading (true);
    var response = await Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    isLoading (false);
    return response!=null;
  }
}