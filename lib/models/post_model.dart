import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel{
  String? post_url;
  String? profile_url;
  String? email;
  int? id;
  String? name;
  String? department;
  String ?caption;
  PostModel({this.post_url,this.profile_url,this.email,this.id,this.name,this.department,this.caption});
 toObj(){
   return {
     "post_url":post_url,
     "profile_url":profile_url,
     "email":email,
     "id":id,
     "name":name,
     "department":department,
     "caption":caption
   };
 }
 fromObj(DocumentSnapshot<Map<String,dynamic>>post){
 post_url=post.get("post_url");
 profile_url=post.get("profile_url");
 email=post.get("email");
 id=post.get("id");
 name=post.get("name");
 department=post.get("department");
 caption=post.get("caption");
 }
 fromMap(Map<String,dynamic>post){
post_url=post["post_url"];
 profile_url=post["profile_url"];
 email=post["email"];
 id=post["id"];
 name=post["name"];
 department=post["department"];
 caption=post["caption"];
 }
}