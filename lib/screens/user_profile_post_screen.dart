import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
import 'package:stuck/models/post_model.dart';
import 'package:stuck/widgets/PostWidget.dart';
class UserProfilePostScreen extends StatefulWidget {
  PostModel post;
  UserProfilePostScreen(this.post);

  @override
  State<UserProfilePostScreen> createState() => _UserProfilePostScreenState(this.post);
}

class _UserProfilePostScreenState extends State<UserProfilePostScreen> {
  PostModel post;
  _UserProfilePostScreenState(this.post);
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    height=size.height;
    width=size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },),
      title: Text("Post Screen",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      ),
      body: SafeArea(child: Center(
        child: Column(
        
          children: [
        PostWidget(post),
        SizedBox(height: height*0.01,),
        SizedBox(
          width: width*0.95,
          child: TextField(
          
          maxLines: 2,
          decoration: InputDecoration(
            hintText: "Comment",
            border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
        ),height: height*0.1,)
        ,SizedBox(height: height*0.01,),
        SingleChildScrollView(
          child: Column(children:[]),
        ),
        ],),
      )),
    );
  }
}