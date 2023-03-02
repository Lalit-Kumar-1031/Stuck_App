import 'dart:typed_data';
import 'package:stuck/screens/bottom_tab_screen.dart';
import 'package:stuck/utils/Utils.dart';
import 'package:stuck/widgets/custom_text_field.dart';

import '../models/user_model.dart' as umd;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
import 'package:stuck/utils/auth_methods.dart';
import 'package:stuck/utils/storage_method.dart';

class AddPostScreen extends StatefulWidget {
  umd.User user;
  AddPostScreen(this.user);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState(this.user);
}

class _AddPostScreenState extends State<AddPostScreen> {
  var _auth = FirebaseAuth.instance;
  Uint8List? image;
  umd.User user;
  var _captionController=TextEditingController();
  _AddPostScreenState(this.user);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 241, 241),
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            
          },
        ),
        title: Text(
          "Post",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () async{
               var res=await Storage().uplaodPost(image!, user,_captionController.text);
              print(res);
              if(res=="Success"){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomTabScreen()));
                Utils().showSnackBar(context: context, content:"Post uploaded successfully");
              }
              },
              child: Text(
                "Publish",
                style: TextStyle(fontSize: height * 0.018),
              )),
        ],
      ),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width*0.015),
            child: ListView(
                  children: [
            SizedBox(
              height: height * 0.03,
            ),
            Material(
              borderRadius: BorderRadius.circular(height*0.01),
              elevation: 1,
              child: Container(
                height: height*0.56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(height*0.01)),
                  child: Column(children: [
                    Container(
                      width: double.infinity,
                      height: height*0.07,
                      child: ListTile(
                      
                        minVerticalPadding: height*0.01,
                        leading: CircleAvatar(backgroundImage: NetworkImage(user.url!),
                        radius: height*0.025,
                        ),
                        horizontalTitleGap: width*0.02,
                        title: Text(_auth.currentUser!.displayName.toString()),
                        subtitle: Text(user.department!),
                      ),
                      
                    ),
                    SizedBox(height: height*0.01,),
                   
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal:width*0.01),
                      child: Container(
                      height: height*0.415,
                      width: double.infinity,
                      child: image==null?Center(child: Text("Select a pic"),):Image.memory(image!,fit: BoxFit.cover,),
                      ),
                    ),
                    SizedBox(height: height*0.005,),
                    Padding(
                      padding:EdgeInsets.all(height*0.008),
                      child: Row(children: [
                        Icon(Icons.favorite_outline,size: height*0.03,),
                        SizedBox(width: width*0.035,),
                        Icon(Icons.comment,size: height*0.03,),
                        SizedBox(width: width*0.035,),
                        Icon(Icons.share,size: height*0.03,),
                      ],),
                    ),
                  ]),
              ),
            ),
                              SizedBox(height: 12,),

                              TextFormField(
                                controller: _captionController,
                                maxLines: 3,
                                decoration: InputDecoration(
                                  hintText: "Caption here",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),


                              SizedBox(height: height*0.01,),
            ElevatedButton(onPressed: ()async{
                      image=await AuthMethod().getUserImage();
                      
                      setState(() {
                        
                      });
                    }, child: Text("Pick an Image"),),
                  ],
                ),
          )),
      
    );
  }
}
