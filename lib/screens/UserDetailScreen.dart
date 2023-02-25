import 'package:flutter/material.dart';
import 'package:stuck/University_Department_Data/Department_List.dart';
import 'package:stuck/utils/Utils.dart';
import 'package:stuck/widgets/custom_text_field.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({Key? key}) : super(key: key);

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  List<String> Courses = [];
  List<String> Branchs = [];
  String? selectedDepartment;
  String? selectedCourse;
  String? selectedBranch;

  String? selectgender;
  String? selectedyear;

  final mobController = TextEditingController();
  final rollnoController = TextEditingController();
  final yearController=TextEditingController();
  Size screensize = Utils().getScreenSize();

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
              backgroundImage: AssetImage('assets/Images/boy1.png'),
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
                                Branchs = [];
                                setState(() {
                                  selectedDepartment = val;
                                  Courses =
                                      departmentToCourse[selectedDepartment]!;
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
                              items: Courses.map((e) {
                                return DropdownMenuItem<String>(
                                  child: Text(e),
                                  value: e,
                                );
                              }).toList(),
                              onChanged: (val) {
                                selectedBranch = null;
                                setState(() {
                                  selectedCourse = val;
                                  Branchs = courseToBranch[selectedCourse]!;
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
                              items: Branchs.map((e) {
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
                                items: genter.map((e) {
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
                  onPressed: () {},
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
