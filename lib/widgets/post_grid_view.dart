import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
import '../models/user_model.dart';
class PostGridView extends StatefulWidget {
  User user;
  Size size;
  PostGridView(this.user,this.size);
  @override
  State<PostGridView> createState() => _PostGridViewState(this.user,this.size);
}

class _PostGridViewState extends State<PostGridView> {
  User user;
  Size size;
  List<Widget>pics=[];
  _PostGridViewState(this.user,this.size);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("students").doc(user.email).collection("posts").snapshots(),
      builder: (context,snapshot){
  
    if(snapshot.hasError){
      return Container(height: size.height*0.3,
      child: Center(child: Text("Some error occured"),),
      );
    }
    if(snapshot.hasData){
    pics=
    snapshot.data!.docs.map((e){
      var data=e.data() as Map<String,dynamic> ;
      print(data["post_url"]);
    return Container(
      height: size.width*0.33333,
      width: size.width*0.33333,
      child: Image.network(data["post_url"],fit: BoxFit.cover,),);
    }
    ).toList();
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        children: pics,
      ),
    );
    }
    return Container(height: size.height*0.3,
      child: Center(child: Text("No posts yet"),),
      );
    });
  }
}