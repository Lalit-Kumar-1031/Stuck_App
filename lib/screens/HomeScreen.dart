import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
        body: SafeArea(
            child: Padding(
              child: Column(children: [
                SizedBox(height: 10,),
                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("posts").snapshots(),
                  builder: (context,snapshot){
                    if(snapshot.hasError){
                      return Center(child: Text("Some Error Occured"),);
                    }
                    if(snapshot.hasData){
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context,index){
                    return Column(
                      children: [
                        ListTile(
                         leading:CircleAvatar(
                           child: CircleAvatar(
                             backgroundImage: NetworkImage(snapshot.data?.docs[index].get('profile_url',),),
                             radius: 18,
                           ),
                           backgroundColor: Colors.grey,
                           radius: 21,
                         ),
                          title: Text(snapshot.data?.docs[index].get('name')),
                          subtitle: Text(snapshot.data?.docs[index]['department']),
                          trailing: PopupMenuButton(itemBuilder: (context) =>
                            [

                            ]
                          ,),
                        ),
                        SizedBox(height: 10,),

                        Container(
                          height: 350,
                          width: double.infinity,
                          child: Image.network(snapshot.data!.docs[index].get("post_url"),fit: BoxFit.cover,)),
                      ],
                    );
                    }),
                  );}
                  return Center(child: Text("No posts to show!"),);
                })
              ]),
          padding: EdgeInsets.symmetric(horizontal: 10),
        )),
      
    );
  }
}
