import 'package:flutter/material.dart';
import 'package:flutter_insta/flutter_insta.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:video_player/video_player.dart';
import 'package:lottie/lottie.dart';

class Insta_Download extends StatefulWidget {
  @override
  State<Insta_Download> createState() => _Insta_DownloadState();
}

class _Insta_DownloadState extends State<Insta_Download> {
  final TextEditingController _controller = TextEditingController();
  String link = "";
  bool pressed = false;
  bool downloading = false;
  int i = 1;
  int status = 0;

  late VideoPlayerController _mycontroller;

  void initState() {
    super.initState();
    _mycontroller = VideoPlayerController.network(
        "https://video.twimg.com/ext_tw_video/1634027653534474243/pu/vid/292x270/fLUTqlVynx2nx2Uv.mp4")..initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {});
    });
  }

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
                link = text;
                _mycontroller = VideoPlayerController.network("https://video.twimg.com/ext_tw_video/1634027653534474243/pu/vid/292x270/fLUTqlVynx2nx2Uv.mp4")..initialize().then((_) {
                  // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
                  setState(() {});
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffF3B8F4),
                prefixIcon:Icon(Icons.insert_link_outlined),
                suffixIcon: IconButton(
                  onPressed: (){_controller.clear();},
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35)
                ),
                hintText: 'Enter URL Of The Video',
              ),
            ),
          ),
        ),


        // Column(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Column(
        //         children: [
        //           Container(
        //             decoration: BoxDecoration(
        //               border: Border.all(
        //                 width: 4,
        //               ),
        //             ),
        //             child: Center(
        //               child: _mycontroller.value.isInitialized
        //                   ? AspectRatio(
        //                 aspectRatio:
        //                 _mycontroller.value.aspectRatio,
        //                 child: VideoPlayer(_mycontroller),
        //               )
        //                   : Text(_mycontroller.value.isInitialized
        //                   .toString()),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     FloatingActionButton(
        //       onPressed: () {
        //         setState(() {
        //           _mycontroller.value.isPlaying
        //               ? _mycontroller.pause()
        //               : _mycontroller.play();
        //         });
        //       },
        //       child: Icon(
        //         _mycontroller.value.isPlaying
        //             ? Icons.pause
        //             : Icons.play_arrow,
        //       ),
        //     ),
        //   ],
        // ),


        Padding(
          padding: const EdgeInsets.all(8.0),
          child: status == 0 ? Container(
            width : MediaQuery.of(context).size.width * 0.01,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                Download();
                status ==1 ? setState(() {
                  downloading = true; //set to true to show Progress indicator
                  pressed = true;
                }) : null;
              }, child: Text(pressed ? "Downloading" : "Download Reels")
                  ,style: ElevatedButton.styleFrom(shape: StadiumBorder(),primary: Color(0xffF350F5),)
              ),
            ),
          ) :
          Container(
            width : MediaQuery.of(context).size.width * 0.01,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.grey,shape: StadiumBorder()),
                  onPressed: (){
                  null;
              }, child: Text(pressed ? "Downloading" : "Download Reels")
              ),
            ),
          )
        ),
        Divider(
            color: Colors.black
        ),
        !pressed ? Lottie.asset('assets/images/insta4.json',width: MediaQuery.of(context).size.width*0.3,
  height: MediaQuery.of(context).size.height*0.250,
  fit: BoxFit.fill,) : Text(""),
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
    FocusManager.instance.primaryFocus?.unfocus();
    String name = "reels_" + i.toString() + ".mp4";
    FlutterInsta flutterInsta = new FlutterInsta();
    String downloadLink = "";
    try {
      downloadLink = await flutterInsta.downloadReels(link); //URL
      print(downloadLink.length.toString());

      setState(() {
        status = 1;
        downloading = true; //set to true to show Progress indicator
        pressed = true;
      });

    }catch(e){
      print(e);
      setState(() {
        status = 0;
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("Download Failed"),
            content: Text("Invalid Link"),
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
      });


    }
    FileDownloader.downloadFile(url: downloadLink.trim(),
    name: name ,
    onDownloadCompleted: (path){
      print(path);
      setState(() {
        i++;
        downloading = false;
        pressed = false;
        status = 0;
      });
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Download Completed"),
          content: Text("Video Downloaded Successfully"),
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


