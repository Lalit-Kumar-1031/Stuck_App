import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:stuck/bottom_sheets/user_info_bottom_sheet.dart';
import 'package:stuck/providers/search_provider.dart';
import 'package:stuck/screens/HomeScreen.dart';
import 'package:stuck/screens/LoginScreen.dart';
import 'package:stuck/screens/add_post_screen.dart';
import 'package:stuck/screens/bottom_tab_screen.dart';
import 'package:stuck/screens/SplashScreen.dart';
import 'package:stuck/screens/UserDetailScreen.dart';
import 'package:stuck/screens/search_screen.dart';
import 'package:stuck/screens/signed_user_profile.dart';
import 'package:stuck/screens/signup_screen.dart';
import 'package:stuck/screens/user_profile.dart';
import 'package:stuck/screens/user_profile_post_screen.dart';
import 'package:stuck/widgets/post_grid_view.dart';
import './custom_user.dart';
late double height;
late double width;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(
  ChangeNotifierProvider(create: (_) =>SearchProvider(),
  child:MaterialApp(
    debugShowCheckedModeBanner: false,
    //home:UserDetailPage(),
    home:SplashScreen(),
   // home: BottomTabScreen(),
  )));
}