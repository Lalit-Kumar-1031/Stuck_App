/*
 final List<String> department=["UIET","Law Department","Commerce Department"];
final List<String> uietcourse=["BTech","MTech"];
final List<String> lawcourse=["Bachelor In Law","Master In Law","Ph.D"];
final List<String> commercecourse=["M.Phil","Master In Commerce"];
final List<String> btecbranch=["CSE","ECE","BT","ME","EIE"];
final List<String> mtecbranch=["CSE","ECE","BT","ME","EE","ME Production","Me Thermal","DT"];
final List<String> blawcourse=["LL.B"];
final List<String> mlawcourse=["LL.M"];
final List<String> phdlawcourse=["Ph.D(Law)"];
final List<String> mphilcommercecourse=["M Phil(Commerce)"];
final List<String> mastercommercecourse=["M.Com"];
String? selected_dept;
String? selected_course;
String? selected_branch;
List<String> course=[];
List<String> branch=[];
 DropdownButtonFormField<String>(
 hint: Text("- Select Course -"),
 value: selectedCourse,
 items:selectedDepartment==""?departmentToCourse[selectedDepartment]!.map((e){
 return DropdownMenuItem<String>
 (child: Text(e),value: e,);
 }).toList():[], onChanged: (val){
 selectedCourse=val.toString();
 setState(() {
 });
 }),
 SizedBox(height: 10,),
 DropdownButtonFormField<String>(
 hint: Text("- Select branch -"),
 value: selectedBranch,
 items:selectedBranch==""?courseToBranch[selectedCourse]!.map((e){
 return DropdownMenuItem<String>
 (child: Text(e),value: e,);
 }).toList():[], onChanged: (val){
 selectedBranch=val.toString();
 setState(() {
 });
 })
 */

final List<String> department=[
  "University Institute of Engineering & Technology",
  "Intitute of Law",
  "Department of Commerce",
  "Institute of Teacher Training & Research",
  "Institute of Integrated & Hons. Studies",
  "Institute of Environmental Studies",
  "Institute of Management Studies",
  "Institute of Mass Communication & Media Technology",
  "University School of Management"
  "Department of Instrumentation",
  "Institute of Pharmaceuticals",
  "Tourism Hotel Management"
];

Map<String,List<String>>departmentToCourse={
  "Tourism Hotel Management":["BHM & CT","MTTM","MHM & CT","Ph.D (Hotel Management)","Ph.D (Tourism)"],
  "Institute of Pharmaceuticals":["B.Pharmacy","M. Pharmacy",'Ph.D(Pharmacy)'],
  "Department of Instrumentation":["BTech"],
  "University Institute of Engineering & Technology":["Bachelor's of Technology","Master's of Technology"],
   "Instititue of Law":["Bachelor's In Law","Master's In Law","Ph.D"],
   "Department of Commerce":["Master's in Philosphy","Master's In Commerce"],
};
Map<String,List<String>>courseToBranch={
  "BTech":["BTech (Electrical & Instrumentation Engineering)"],
  "Bachelor's of Technology":["Computer Science & Engineering","Electronics & Communication Engineering","Biotechnology","Mechanical Engineering"],
  "Master's of Technology":["Computer Science & Engineering","Electronics & Communication Engineering","Biotechnology","Mechanical Engineering","Electrical Engineering","Mechanical Engineering","Me Thermal","DT"],
  "Bachelor's In Law":["LL.B"],
  "Master's In Law":["LL.M"],
  "Ph.D":["Ph.D(Law)"],
  "B.Pharmacy":[],
  "M.Phil":["M Phil(Commerce)"],
  "Master In Commerce":["M.Com"]

};

List<String> gender=['Male','Female','Others'];

List<String> graduationyear=['2023','2024','2025','2026','2027','2028','2029','2030'];
