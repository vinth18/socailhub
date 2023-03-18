import 'package:flutter/material.dart';
import 'package:flutter_insta/flutter_insta.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class Insta_Download_posts extends StatefulWidget {
  @override
  State<Insta_Download_posts> createState() => _Insta_DownloadState();
}

class _Insta_DownloadState extends State<Insta_Download_posts> {
  final TextEditingController _controller = TextEditingController();
  String link = "";
  bool pressed = false;
  bool downloading = false;
  int i = 1;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (text) {
              link = text;
            },
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: (){_controller.clear();},
                icon: Icon(Icons.clear),
              ),
              border: OutlineInputBorder(),
              hintText: 'Enter URL Of The Post',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: (){
            setState(() {
              downloading = true; //set to true to show Progress indicator
              pressed = true;
            });
            Download();
          }, child: Text(pressed ? "Downloading" : "Download Post")),
        ),
        downloading
            ? Center(
          child: CircularProgressIndicator(), //if downloading is true show Progress Indicator
        )
            : Container()
      ],
    ),
  );

  void getinfo() async{
    print("Clicked");
    FlutterInsta flutterInsta = new FlutterInsta();
    await flutterInsta.getProfileData("v.i.v.e.k_1605");
    print("Username : ${flutterInsta.username}");
    print("Followers : ${flutterInsta.followers}");
    print("Folowing : ${flutterInsta.following}");
    print("Bio : ${flutterInsta.bio}");
    print("Website : ${flutterInsta.website}");
    print("Profile Image : ${flutterInsta.imgurl}");
    //print("Feed images":${flutterInsta.feedImagesUrl}");
  }

  void Download() async{
    String name = "posts_" + i.toString() + ".mp4";
    FlutterInsta flutterInsta = new FlutterInsta();
    link = FlutterInsta().downloadReels(link).toString();
    //String downloadlink = flutterInsta.downloadImage(link) as String;
    FileDownloader.downloadFile(url: link.trim(),
        name: name ,
        onDownloadCompleted: (path){
          print(path);
          setState(() {
            i++;
            downloading = false;
            pressed = false;
          });
        });

    // await FlutterDownloader.enqueue(
    //   url: '$downloadLink',
    //   savedDir: '/sdcard/Download',
    //   showNotification: true,
    //   // show download progress in status bar (for Android)
    //   openFileFromNotification: true, // click on notification to open downloaded file (for Android)
    // ).whenComplete(() {
    //   setState(() {
    //     downloading = false; // set to false to stop Progress indicator
    //   });

  }
}


