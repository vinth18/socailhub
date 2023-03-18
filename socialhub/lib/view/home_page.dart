import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:onboarding_app/controller/data_provider.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:video_player/video_player.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  DownloadComplete(){
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
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool isFirstTime = true;

  late VideoPlayerController _controller;
  bool isInitialized = false;

  void initState() {
    super.initState();
    _controller = VideoPlayerController.network("https://video.twimg.com/ext_tw_video/1634027653534474243/pu/vid/292x270/fLUTqlVynx2nx2Uv.mp4")..initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {});
    });
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        centerTitle: true,
        //backgroundColor: Color(0xffDF2E38),
        backgroundColor: Color(0xffF55050),
        leading: Row(
          children: [
            IconButton(
              onPressed: () {Navigator.of(context, rootNavigator: true).pop(context);},
              icon: Icon(Icons.arrow_back,size: 22,),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(200),bottomRight: Radius.circular(200))
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.125),
          child: Container(
            child: Lottie.asset('assets/images/you1.json',width: MediaQuery.of(context).size.width*0.3,
              height: MediaQuery.of(context).size.height*0.125,
              fit: BoxFit.fill,),
          ),
        ),
        title: Text('Youtube',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20,),
          Consumer<DataProvider>(
            builder: (context, controller, child) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                cursorColor: Colors.black,
                                controller: controller.UrlController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffF55050),
                                  prefixIcon:Icon(Icons.insert_link_outlined),
                                  suffixIcon: IconButton(
                                    onPressed: (){controller.UrlController.clear();},
                                    icon: Icon(Icons.clear),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35)
                                  ),
                                  hintText: 'Enter URL of the video',
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                      ],
                    ),

                    InkWell(
                      onTap: (){ controller.progress = 0;
                      // _controller = VideoPlayerController.network(controller.UrlController.text)..initialize().then((_) {
                      //   // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
                      //   setState(() {});
                      //   isInitialized = true;
                      // });
                      // setState(() {isInitialized = true;});     ----------> YOUTUBE LINK SHOULD HAVE DIRECT ACCESS TO VIDEO i.e At Last .MP4 should be there in url

                      isFirstTime = false;
                      controller.getVideeoInfo(controller.UrlController.text);
                      FocusManager.instance.primaryFocus?.unfocus();},
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffDF2E38),
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    Divider(
                      color: Colors.black,
                    ),
                    controller.videoID.isEmpty
                        ? Text('')
                        :
                    Container(
                          child: Image.network(
                              'https://img.youtube.com/vi/${controller.videoID}/0.jpg',
                              scale: 2.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red,width: 4),
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                        ),
                    isInitialized ?  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 4,
                              ),
                            ),
                            child: Center(
                              child: _controller.value.isInitialized
                                  ? AspectRatio(
                                aspectRatio:
                                _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              )
                                  : Text(_controller.value.isInitialized
                                  .toString()),
                            ),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                              });
                            },
                            child: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                          ),
                        ],
                      ),
                    ) : Text(""),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(controller.videoTitle,style:TextStyle(color: Colors.black,fontSize: 18),),
                    ),
                    //SizedBox(height: 1),
                    controller.videoID.isEmpty
                        ? Text('')
                        : Column(
                            children: [
                              SizedBox(height: 10),
                              TextButton.icon(
                                onPressed: controller.start
                                    ? null
                                    : () {
                                        controller.downloadVideo(
                                            controller.UrlController.text);
                                      },
                                icon: Icon(Icons.download),
                                label: Text('Download Video'),
                              ),
                            ],
                          ),
                    !isFirstTime ? !controller.videoID.isEmpty ? controller.progress > 0
                        ? Column(
                            children: [
                              Text(
                                  '${controller.progress == 2 ? '100' : (controller.progress * 100).toInt()} %',
                                  style: TextStyle(color: Colors.black,
                                      fontSize: 20, fontWeight: FontWeight.bold)),
                              SizedBox(height: 12),
                              LinearProgressIndicator(
                                value: controller.progress,
                                backgroundColor: Colors.grey,
                                valueColor:
                                const AlwaysStoppedAnimation<Color>(Colors.red),
                              ),

                            ],
                          )
                        : Text('') : Center(child: Text("Invalid Link",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),)) : Lottie.asset('assets/images/you5.json',width: MediaQuery.of(context).size.width*0.7,
              height: MediaQuery.of(context).size.height*0.250,
              fit: BoxFit.fill,),

                    // controller.progress == 100 ? DownloadComplete() : SizedBox(height: 0,)
                  ],

                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
