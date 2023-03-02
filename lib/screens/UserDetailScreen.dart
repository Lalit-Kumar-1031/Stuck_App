import 'package:flutter/material.dart';
import 'package:stuck/University_Department_Data/Department_List.dart';
import 'package:stuck/screens/bottom_tab_screen.dart';
import 'package:stuck/utils/Utils.dart';
import 'package:stuck/utils/storage_method.dart';
import 'package:stuck/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
class UserDetailPage extends StatefulWidget {
  const UserDetailPage({Key? key}) : super(key: key);

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {

  var _auth=FirebaseAuth.instance;
  String? name;
  String ?email;
  String? url;
  String? selectedDepartment;
  String? selectedCourse;
  String? selectedBranch;
  String? selectgender;
  String? selectedyear;

  final mobController = TextEditingController();
  final rollnoController = TextEditingController();
  final yearController=TextEditingController();
  Size screensize = Utils().getScreenSize();
  String? getInfo(){
    _auth.currentUser!.reload();
    url=_auth.currentUser!.photoURL;
    name=_auth.currentUser!.displayName;
    email=_auth.currentUser!.email;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(""),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
            child: CircleAvatar(
              backgroundImage: NetworkImage(url.toString()),
              radius: 22,
            ),
          ),
          SizedBox(width: 10,),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                child:Row(
                  children: [
                    SizedBox(width: 30,),
                    Text(
                      "Complete Your Profile ",
                      style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold ),
                    ),
                  ],
                ) ,
              ),
              SizedBox(height: 10,),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(15)),
                  //height: screensize.height * 0.7,
                  width: screensize.width * 0.9,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30.0),
                        child: Column(
                          children: [
                            SizedBox(
                              
                              child: CustomTextField(rollnoController, "Enter Roll No",
                                  Icons.supervised_user_circle, false),
                              height: 50,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              child: CustomTextField(mobController, "Enter Mobile No",
                                  Icons.phone, false),
                              height: 50,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              hint: Text("- Select Department -"),
                              borderRadius: BorderRadius.circular(10),
                              style:
                              TextStyle(fontSize: 14, color: Colors.black),
                              value: selectedDepartment,
                              items: department.map((e) {
                                return DropdownMenuItem<String>(
                                  child: Text(e),
                                  value: e,
                                );
                              }).toList(),
                              onChanged: (val) {
                                selectedCourse = null;
                                selectedBranch = null;
                              
                                setState(() {
                                  selectedDepartment = val;
                                  
                                });
                              },
                              isExpanded: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              hint: Text("- Select Course -"),
                              borderRadius: BorderRadius.circular(10),
                              style:
                              TextStyle(fontSize: 14, color: Colors.black),
                              value: selectedCourse,
                              items: departmentToCourse[selectedDepartment]?.map((e) {
                                return DropdownMenuItem<String>(
                                  child: Text(e),
                                  value: e,
                                );
                              }).toList(),
                              onChanged: (val) {
                                selectedBranch = null;
                                setState(() {
                                  selectedCourse = val;
                              
                                });
                              },
                              isExpanded: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              hint: Text("- Select Branch -"),
                              borderRadius: BorderRadius.circular(10),
                              style:
                              TextStyle(fontSize: 14, color: Colors.black),
                              value: selectedBranch,
                              items: courseToBranch[selectedCourse]?.map((e) {
                                return DropdownMenuItem<String>(
                                  child: Text(e),
                                  value: e,
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  selectedBranch = val;
                                });
                              },
                              isExpanded: true,
                            ),
                            SizedBox(height: 10,),
                            DropdownButtonFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                value: selectgender,
                                hint: Text("- Select Gender -"),
                                borderRadius: BorderRadius.circular(10),
                                items: gender.map((e) {
                                  return DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  selectgender = val;
                                }),
                            SizedBox(height: 10,),

                            DropdownButtonFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                hint: Text("- Select Graduation Yaer -"),
                                value:selectedyear ,
                                borderRadius: BorderRadius.circular(20),
                                items:graduationyear.map((e){
                                  return DropdownMenuItem(
                                      value: e,
                                      child:Text(e));
                                }).toList(),
                                onChanged:(val){
                                  setState(() {
                                    selectedyear=val;
                                  });
                                }
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async{
                    var res=await Storage().saveUserInfo(url:url.toString(),name: name.toString(), email: email.toString(), roll_no: rollnoController.text, department:selectedDepartment.toString(), branch: selectedBranch.toString(), course: selectedCourse.toString(), gender: selectgender.toString(), phoneNo: mobController.text, year: selectedyear.toString());
                  print(res);
                  if(res=="Success"){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomTabScreen()));
                  }
                  },
                  child: Text(
                    "Continue ->",
                    style: TextStyle(fontFamily: 'Lalit', letterSpacing: 1),
                  )),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
