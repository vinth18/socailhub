import 'package:flutter/material.dart';
import 'onboarding_screen.dart';
import 'home.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  var prefs = await SharedPreferences.getInstance();
  var boolKey = 'isFirstTime';

 if(prefs.getBool('isFirstTime')!=null){
   print(" prefs.getBool(boolKey) NOt null  "+ prefs.getBool('isFirstTime').toString());
 }else{
   prefs.setBool('isFirstTime',true);
 }



  print("Before :  " + prefs.getBool('isFirstTime').toString());


  if(prefs.getBool('isFirstTime')==true){
    WidgetsFlutterBinding.ensureInitialized();
    runApp(MyApp(prefs, boolKey));
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
    print("Inside If :  " + prefs.getBool('isFirstTime').toString());
    prefs.setBool(boolKey, false);
    print("Inside If - After :  " + prefs.getBool('isFirstTime').toString());
  }else{
    print("Inside Else :  " + prefs.getBool('isFirstTime').toString());
    runApp(Home());
  }

  //runApp(MyApp(prefs, boolKey));
}


class MyApp extends StatelessWidget {
  //MyApp({Key? key}) : super(key: key);

  final SharedPreferences prefs;
  final String boolKey;
  MyApp(this.prefs, this.boolKey);

  @override
  Widget build(BuildContext context) {
    //prefs.setBool(boolKey, false);
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnboardingScreen(),
      );
  }
}
