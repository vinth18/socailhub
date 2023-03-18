import 'dart:io';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta/flutter_insta.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletons/skeletons.dart';
import 'package:lottie/lottie.dart';

class Insta_Profile extends StatefulWidget {
  @override
  State<Insta_Profile> createState() => _Insta_ProfileState();
}

class _Insta_ProfileState extends State<Insta_Profile> {
  final TextEditingController _controller = TextEditingController();
   FlutterInsta flutterInsta= new FlutterInsta();
  bool _resp_loaded=false;
  bool _bio_empty=true;
  bool _website_empty=true;
  String username = "";
  bool pressed = false;
  String msg = "";
  int i = 1;
  int status = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              onChanged: (text) {
                  username = text;
                print("uname : " + username);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffF3B8F4),
                prefixIcon:Icon(Icons.person),
                suffixIcon: IconButton(
                  onPressed: (){_controller.clear();},
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35)
                ),
                hintText: 'Enter Username',
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width : MediaQuery.of(context).size.width * 0.01,
                //child: ElevatedButton(onPressed: getinfo, child: Text("Get"),style: ElevatedButton.styleFrom(shape: StadiumBorder(),primary: Color(0xffF350F5),),))
                child : ElevatedButton(onPressed: getinfo, child: Text("Get"),style: ElevatedButton.styleFrom(shape: StadiumBorder(),primary: Color(0xffF350F5),))),
          )
  ),

        Divider(
            color: Colors.black
        ),

        // _resp_loaded ?   Center(
        //   child: Column(
        //     children: [
        //       Container(
        //         decoration: BoxDecoration(
        //           border: Border.all(
        //             width: 4,
        //           ),
        //         ),
        //         child:Image.network(flutterInsta.imgurl),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child:  status !=1 ? ElevatedButton(onPressed: download, child: Text("Download Profile"))  : ElevatedButton(onPressed: null, child: Text("Download Profile"),style: ElevatedButton.styleFrom(primary: Colors.black))
        //       ),
        //       Text(flutterInsta.username,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        //       Text("Followers : ${flutterInsta.followers}",style: TextStyle(fontSize: 20)),
        //       Text("Following : ${flutterInsta.following}",style: TextStyle(fontSize: 20)),
        //
        //         Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Text("Bio : ${flutterInsta.bio}",
        //               style: TextStyle(fontSize: 20)),
        //         ),
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Text("Website : ${flutterInsta.website}",style: TextStyle(fontSize: 20)),
        //       ),
        //
        //
        //       // InkWell(
        //       //   onTap: () => launchUrl(Uri.parse(flutterInsta.website)),
        //       //   child: Padding(
        //       //     padding: const EdgeInsets.all(8.0),
        //       //     child: Text(
        //       //       "Website : ${flutterInsta.website}",
        //       //       style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue,fontSize: 20),
        //       //     ),
        //       //   ),
        //       // ),
        //     ],
        //   ),
        // ):Center(child: Text(msg,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),))

        _resp_loaded ?   Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/5)
                          ),
                          child:CircleAvatar(backgroundImage: NetworkImage(flutterInsta.imgurl),radius: MediaQuery.of(context).size.width/5,),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                              Text(flutterInsta.username,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Text("Followers : ${flutterInsta.followers}",style: TextStyle(fontSize: 14)),
                              Text("Following : ${flutterInsta.following}",style: TextStyle(fontSize: 14)),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Bio : ${flutterInsta.bio}",
                                        style: TextStyle(fontSize: 14)),
                                  ),
                                ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  status !=1 ? ElevatedButton(onPressed: download, child: Text("Download Profile"),style: ElevatedButton.styleFrom(shape: StadiumBorder(),primary: Color(0xffF350F5),))  : ElevatedButton(onPressed: null, child: Text("Download Profile"),style: ElevatedButton.styleFrom(shape: StadiumBorder(),primary: Colors.black))
              ),
            ],
          ),
        ):msg=="No Record Found" ? Center(child: Text(msg,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)) : pressed ? Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
  padding: const EdgeInsets.all(8.0),
  child: SkeletonItem(
  child: Column(
  children: [
  Row(
  children: [
  SkeletonAvatar(
  style: SkeletonAvatarStyle(
  shape: BoxShape.circle, width: 120, height: 120),
  ),
  SizedBox(width: 20),
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SkeletonLine(
            style: SkeletonLineStyle(
                height: 16,
                width: 150,
                borderRadius: BorderRadius.circular(8)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SkeletonLine(
            style: SkeletonLineStyle(
                height: 16,
                width: 150,
                borderRadius: BorderRadius.circular(8)),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SkeletonLine(
            style: SkeletonLineStyle(
                height: 50,
                width: 150,
                borderRadius: BorderRadius.circular(8)),
          ),
        ),
        SizedBox(width: 8),
      ],
    )
  ],
  ),
  SizedBox(height: 12),
  Row(
    children: [
      SizedBox(height: 8,width: MediaQuery.of(context).size.width*0.3,),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SkeletonLine(
          style: SkeletonLineStyle(
              height: 25,
              width: 75,
              borderRadius: BorderRadius.circular(16)),
        ),
      )
    ],
  ),

  ],
  )),
  ),
  )
            :  Lottie.asset('assets/images/insta3.json',width: MediaQuery.of(context).size.width*0.7,
          height: MediaQuery.of(context).size.height*0.25,
          fit: BoxFit.fill,),
        // Center(child: Text(msg,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),))

      ],
    ),
  );


  // @override
  // Widget build(BuildContext context) => Scaffold(
  //   body: ListView(
  //     children: [
  //       // Figma Flutter Generator Androidlarge1Widget - FRAME
  //       Container(
  //           width: 360,
  //           height: 800,
  //           decoration: BoxDecoration(
  //             color : Color.fromRGBO(255, 255, 255, 1),
  //           ),
  //           child: Stack(
  //               children: <Widget>[
  //                 Positioned(
  //                     top: -150,
  //                     left: 0,
  //                     child: Container(
  //                         width: 360,
  //                         height: 300,
  //                         decoration: BoxDecoration(
  //                           boxShadow : [BoxShadow(
  //                               color: Color.fromRGBO(0, 0, 0, 0.25),
  //                               offset: Offset(0,4),
  //                               blurRadius: 4
  //                           )],
  //                           color : Color.fromRGBO(244, 77, 217, 1),
  //                           border : Border.all(
  //                             color: Color.fromRGBO(188, 109, 175, 1),
  //                             width: 1,
  //                           ),
  //                           borderRadius : BorderRadius.all(Radius.elliptical(360, 300)),
  //                         )
  //                     )
  //                 ),Positioned(
  //                     top: 28,
  //                     left: 59,
  //                     child: Text('Instagram', textAlign: TextAlign.left, style: TextStyle(
  //                         color: Color.fromRGBO(255, 255, 255, 1),
  //                         fontFamily: 'Arbutus Slab',
  //                         fontSize: 36,
  //                         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
  //                         fontWeight: FontWeight.normal,
  //                         height: 1
  //                     ),)
  //                 ),Positioned(
  //                     top: 732,
  //                     left: -38,
  //                     child: Container(
  //                         width: 105,
  //                         height: 101,
  //                         decoration: BoxDecoration(
  //                           color : Color.fromRGBO(241, 101, 202, 1),
  //                           border : Border.all(
  //                             color: Color.fromRGBO(196, 125, 202, 1),
  //                             width: 1,
  //                           ),
  //                           borderRadius : BorderRadius.all(Radius.elliptical(105, 101)),
  //                         )
  //                     )
  //                 ),Positioned(
  //                     top: 732,
  //                     left: 293,
  //                     child: Container(
  //                         width: 105,
  //                         height: 101,
  //                         decoration: BoxDecoration(
  //                           color : Color.fromRGBO(241, 101, 202, 1),
  //                           border : Border.all(
  //                             color: Color.fromRGBO(214, 124, 200, 1),
  //                             width: 1,
  //                           ),
  //                           borderRadius : BorderRadius.all(Radius.elliptical(105, 101)),
  //                         )
  //                     )
  //                 ),Positioned(
  //                     top: 179,
  //                     left: 34,
  //                     child: Container(
  //                         width: 128,
  //                         height: 133,
  //                         decoration: BoxDecoration(
  //                           borderRadius : BorderRadius.only(
  //                             topLeft: Radius.circular(15),
  //                             topRight: Radius.circular(15),
  //                             bottomLeft: Radius.circular(15),
  //                             bottomRight: Radius.circular(15),
  //                           ),
  //                           color : Color.fromRGBO(243, 184, 244, 1),
  //                           border : Border.all(
  //                             color: Color.fromRGBO(222, 130, 212, 1),
  //                             width: 1,
  //                           ),
  //                         )
  //                     )
  //                 ),Positioned(
  //                     top: 179,
  //                     left: 200,
  //                     child: Container(
  //                         width: 128,
  //                         height: 133,
  //                         decoration: BoxDecoration(
  //                           borderRadius : BorderRadius.only(
  //                             topLeft: Radius.circular(15),
  //                             topRight: Radius.circular(15),
  //                             bottomLeft: Radius.circular(15),
  //                             bottomRight: Radius.circular(15),
  //                           ),
  //                           boxShadow : [BoxShadow(
  //                               color: Color.fromRGBO(0, 0, 0, 0.25),
  //                               offset: Offset(0,4),
  //                               blurRadius: 4
  //                           )],
  //                           color : Color.fromRGBO(243, 184, 244, 1),
  //                           border : Border.all(
  //                             color: Color.fromRGBO(221, 132, 206, 1),
  //                             width: 1,
  //                           ),
  //                         )
  //                     )
  //                 ),Positioned(
  //                     top: 265,
  //                     left: 67,
  //                     child: Text('Profile', textAlign: TextAlign.left, style: TextStyle(
  //                         color: Color.fromRGBO(228, 0, 191, 1),
  //                         fontFamily: 'Arbutus Slab',
  //                         fontSize: 20,
  //                         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
  //                         fontWeight: FontWeight.normal,
  //                         height: 1
  //                     ),)
  //                 ),Positioned(
  //                     top: 265,
  //                     left: 240,
  //                     child: Text('Reels', textAlign: TextAlign.left, style: TextStyle(
  //                         color: Color.fromRGBO(228, 0, 192, 1),
  //                         fontFamily: 'Arbutus Slab',
  //                         fontSize: 20,
  //                         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
  //                         fontWeight: FontWeight.normal,
  //                         height: 1
  //                     ),)
  //                 ),Positioned(
  //                     top: 215,
  //                     left: 240,
  //                     child: Container(
  //                         width: 44,
  //                         height: 37.57539367675781,
  //
  //                         child: Stack(
  //                             children: <Widget>[
  //                               Positioned(
  //                                   top: 0,
  //                                   left: 0,
  //                                   child: Container(
  //                                       width: 44,
  //                                       height: 37.57539367675781,
  //
  //                                       child: Stack(
  //                                           children: <Widget>[
  //                                             Positioned(
  //                                                 top: 0,
  //                                                 left: 0,
  //                                                 child: SvgPicture.asset('assets/images/vector.svg', semanticsLabel: 'vector')
  //                                             ),Positioned(
  //                                                 top: 5.827236175537109,
  //                                                 left: 30.06819725036621,
  //                                                 child: SvgPicture.asset(
  //                                                     'assets/images/vector_1.svg',
  //                                                     semanticsLabel: 'vector'
  //                                                 )
  //                                             ),Positioned(
  //                                                 top: 8.715009689331055,
  //                                                 left: 15.373711585998535,
  //                                                 child: SvgPicture.asset(
  //                                                     'assets/images/vector_2.svg',
  //                                                     semanticsLabel: 'vector'
  //                                                 )
  //                                             ),
  //                                           ]
  //                                       )
  //                                   )
  //                               ),
  //                             ]
  //                         )
  //                     )
  //                 ),Positioned(
  //                     top: 341,
  //                     left: 34,
  //                     child: Container(
  //                         width: 294,
  //                         height: 42,
  //                         decoration: BoxDecoration(
  //                           borderRadius : BorderRadius.only(
  //                             topLeft: Radius.circular(25),
  //                             topRight: Radius.circular(25),
  //                             bottomLeft: Radius.circular(25),
  //                             bottomRight: Radius.circular(25),
  //                           ),
  //                           color : Color.fromRGBO(243, 184, 244, 1),
  //                           border : Border.all(
  //                             color: Color.fromRGBO(222, 130, 212, 1),
  //                             width: 1,
  //                           ),
  //                         )
  //                     )
  //                 ),Positioned(
  //                     top: 400,
  //                     left: 114,
  //                     child: Container(
  //                         width: 136,
  //                         height: 42,
  //                         decoration: BoxDecoration(
  //                           borderRadius : BorderRadius.only(
  //                             topLeft: Radius.circular(20),
  //                             topRight: Radius.circular(20),
  //                             bottomLeft: Radius.circular(20),
  //                             bottomRight: Radius.circular(20),
  //                           ),
  //                           color : Color.fromRGBO(242, 79, 245, 1),
  //                           border : Border.all(
  //                             color: Color.fromRGBO(222, 130, 212, 1),
  //                             width: 1,
  //                           ),
  //                         )
  //                     )
  //                 ),Positioned(
  //                     top: 410,
  //                     left: 166,
  //                     child: Text('Get', textAlign: TextAlign.left, style: TextStyle(
  //                         color: Color.fromRGBO(255, 255, 255, 1),
  //                         fontFamily: 'Arbutus Slab',
  //                         fontSize: 20,
  //                         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
  //                         fontWeight: FontWeight.normal,
  //                         height: 1
  //                     ),)
  //                 ),Positioned(
  //                     top: 460,
  //                     left: 0,
  //                     child: Divider(
  //                         color: Color.fromRGBO(210, 181, 206, 1),
  //                         thickness: 1
  //                     )
  //
  //                 ),Positioned(
  //                     top: 481,
  //                     left: 15,
  //                     child: Container(
  //                         width: 166,
  //                         height: 162,
  //                         decoration: BoxDecoration(
  //                           color : Color.fromRGBO(217, 217, 217, 1),
  //                           borderRadius : BorderRadius.all(Radius.elliptical(166, 162)),
  //                         )
  //                     )
  //                 ),Positioned(
  //                     top: 476,
  //                     left: 196,
  //                     child: Container(
  //                         width: 132,
  //                         height: 32,
  //                         decoration: BoxDecoration(
  //                           borderRadius : BorderRadius.only(
  //                             topLeft: Radius.circular(10),
  //                             topRight: Radius.circular(10),
  //                             bottomLeft: Radius.circular(10),
  //                             bottomRight: Radius.circular(10),
  //                           ),
  //                           color : Color.fromRGBO(217, 217, 217, 1),
  //                         )
  //                     )
  //                 ),Positioned(
  //                     top: 520,
  //                     left: 196,
  //                     child: Container(
  //                         width: 107,
  //                         height: 24,
  //                         decoration: BoxDecoration(
  //                           borderRadius : BorderRadius.only(
  //                             topLeft: Radius.circular(10),
  //                             topRight: Radius.circular(10),
  //                             bottomLeft: Radius.circular(10),
  //                             bottomRight: Radius.circular(10),
  //                           ),
  //                           color : Color.fromRGBO(217, 217, 217, 1),
  //                         )
  //                     )
  //                 ),Positioned(
  //                     top: 556,
  //                     left: 196,
  //                     child: Container(
  //                         width: 107,
  //                         height: 24,
  //                         decoration: BoxDecoration(
  //                           borderRadius : BorderRadius.only(
  //                             topLeft: Radius.circular(10),
  //                             topRight: Radius.circular(10),
  //                             bottomLeft: Radius.circular(10),
  //                             bottomRight: Radius.circular(10),
  //                           ),
  //                           color : Color.fromRGBO(217, 217, 217, 1),
  //                         )
  //                     )
  //                 ),Positioned(
  //                     top: 592,
  //                     left: 196,
  //                     child: Container(
  //                         width: 139,
  //                         height: 75,
  //                         decoration: BoxDecoration(
  //                           borderRadius : BorderRadius.only(
  //                             topLeft: Radius.circular(10),
  //                             topRight: Radius.circular(10),
  //                             bottomLeft: Radius.circular(10),
  //                             bottomRight: Radius.circular(10),
  //                           ),
  //                           color : Color.fromRGBO(217, 217, 217, 1),
  //                         )
  //                     )
  //                 ),Positioned(
  //                     top: 708,
  //                     left: 96,
  //                     child: Container(
  //                         width: 169,
  //                         height: 47,
  //                         decoration: BoxDecoration(
  //                           borderRadius : BorderRadius.only(
  //                             topLeft: Radius.circular(20),
  //                             topRight: Radius.circular(20),
  //                             bottomLeft: Radius.circular(20),
  //                             bottomRight: Radius.circular(20),
  //                           ),
  //                           color : Color.fromRGBO(242, 79, 245, 1),
  //                           border : Border.all(
  //                             color: Color.fromRGBO(222, 130, 212, 1),
  //                             width: 1,
  //                           ),
  //                         )
  //                     )
  //                 ),Positioned(
  //                     top: 720,
  //                     left: 114,
  //                     child: Text('Download Profile', textAlign: TextAlign.left, style: TextStyle(
  //                         color: Color.fromRGBO(255, 255, 255, 1),
  //                         fontFamily: 'Arbutus Slab',
  //                         fontSize: 16,
  //                         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
  //                         fontWeight: FontWeight.normal,
  //                         height: 1
  //                     ),)
  //                 ),
  //               ]
  //           )
  //       )
  //     ],
  //   ),
  // );



  void getinfo() async{
    setState(() {
      pressed = true;
    });
    FocusManager.instance.primaryFocus?.unfocus();
    print("Clicked with username "+username +" size "+username.length.toString() );

    // if(username==""){
    //   setState(() {
    //     _resp_loaded = false;
    //   });
    // }
    //FlutterInsta flutterInsta = new FlutterInsta();
    if(username!="" && null!=username && username.length>0){
      // flutterInsta = new FlutterInsta();
      await flutterInsta.getProfileData(username);

      if(flutterInsta!=null && flutterInsta.imgurl!=null){

        setState(() {
          _resp_loaded = true;
        });


        print("Username : ${flutterInsta.username}");
        print("Followers : ${flutterInsta.followers}");
        print("Following : ${flutterInsta.following}");
        print("Bio : ${flutterInsta.bio}");
        print("Website : ${flutterInsta.website}");
        print("Profile Image : ${flutterInsta.imgurl}");
        //print("Feed images":${flutterInsta.feedImagesUrl}");

        if(flutterInsta.bio.toString().length!=0){
          setState(() {
            _bio_empty = false;
          });
        }

        if(flutterInsta.website !=null){
          setState(() {
            _website_empty = false;
          });
        }


      }else{
        print("flutterInsta data not loaded : ");

      }


    }else{

      setState(() {
        _resp_loaded = false;
        msg = "No Record Found";

      });
    }
    //instagram username
    //await flutterInsta.downloadImage("https://www.instagram.com/p/CmUv48DLvxd/?utm_source=ig_web_copy_link");
    //print("hello");
  }

   Future<String> createFolder(String f) async {
     //await Permission.manageExternalStorage.request();
     final folderName = f;
     final path = Directory("storage/emulated/0/$folderName");

     if ((await path.exists())) {
       print("path exists.......");
       return path.path;
     } else {
       print("path doesn't exists creating.......");
       path.create();
       return path.path;
     }
   }

  void download() async{
    String name = "profile_" + flutterInsta.username + ".jpg";
    String appDocPath = "";
    String homePath = 'SocialHub';
    appDocPath=await createFolder(homePath);
    String subPath = 'SocialHub' + '/Instagram';
    appDocPath=await createFolder(subPath);
    String subPath2 = 'SocialHub' + '/Instagram' + '/Profile';
    appDocPath=await createFolder(subPath2);
    setState(() {
      status = 1;
    });

    FileDownloader.downloadFile(url: flutterInsta.imgurl.trim(),
    name: name,

      onDownloadCompleted: (path){
        // var file = File('$appDocPath/${name}.jpg');
        //
        // if (file.existsSync()) {
        //   file.deleteSync();
        // }else{
        //   file.create(recursive: true);
        // }
        // var output = file.openWrite(mode: FileMode.writeOnlyAppend);
        print('FILE DOWNLOADED TO PATH: $path');
        //print(file);
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("Download Completed"),
            content: Text("Profile Picture Downloaded Successfully"),
            actions: <Widget>[

              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text("Okay"),
              ),
            ],
          ),
        );

        setState(() {
          status = 0;
        });

      }
    );

  }
}


