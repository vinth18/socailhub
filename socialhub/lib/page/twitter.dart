import 'dart:convert';
import 'package:universal_html/html.dart' as ht;
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:twitter_extractor/twitter_extractor.dart';
import 'package:flutter/material.dart';
import 'package:twitter_extractor/src/models/twitter.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:http/http.dart' as http;
import 'package:twitter_extractor/src/utils/link_utils.dart';
import 'package:video_player/video_player.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';

class Home_Twitter extends StatefulWidget {
  const Home_Twitter({Key? key}) : super(key: key);

  @override
  State<Home_Twitter> createState() => _HomeState();
}

class _HomeState extends State<Home_Twitter> {
  // void getresponse(String link){
  //   print("INSIDE GETRESPONSE");
  //   print(link);
  //   FutureBuilder(
  //       future: TwitterExtractor.extract(link),
  //       builder: (context, AsyncSnapshot<Twitter> snapshot) {
  //         print(snapshot);
  //         if (snapshot.hasData) {
  //           Twitter tweet = snapshot.data!;
  //           print(tweet);
  //           return Center(
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   CircleAvatar(
  //                     child: Image.network(tweet.videos.first.thumb),
  //                   ),
  //                   Text(tweet.videos.first.text),
  //                 ],
  //               ));
  //         }
  //         return const Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       });
  // }

  String resp = "";
  bool isFirstTime = true;
  String extension = "";
  String txt = "";
  String uname = "";

  var _api =
      "https://twittervideodownloaderpro.com/twittervideodownloadv2/index.php";

  ///Returns whether the given url is a valid Twitter url
  bool isValidUrl(String url) => LinkUtils.isValidUrl(url);

  ///Returns username
  String getUsername(String url) => LinkUtils.getUsername(url);

  ///Returns [Twitter] data
  Future<void> extract(String url) async {
    final String? id = LinkUtils.getId(url);
    if (id == null) {
      Future.error("Unable to get ID");
    }
    final http.Response response = await http.post(
      Uri.parse(_api),
      body: {"id": id},
      encoding: Encoding.getByName("utf-8"),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
    );
    print(response.body.toString());
    setState(() {
      resp = response.body.toString();
    });

    var res = response.body.toString();
    var splitted = response.body
        .toString()
        .substring(res.indexOf('[') + 3, res.lastIndexOf(']') - 1)
        .split(',');
    print(splitted);
    var mytxt = splitted[1];
    var myurl = splitted[splitted.length - 2];
    print(mytxt);
    print(myurl);
    mytxt = mytxt.substring(mytxt.indexOf(':')+2,mytxt.indexOf('\\')-1);
    print(mytxt);
    print(myurl.substring(myurl.indexOf("http"), myurl.length - 1));
    var mydownloadlink = myurl
        .substring(myurl.indexOf("http"), myurl.length - 1)
        .replaceAll("\\", "");
    print(mydownloadlink);
    setState(() {
      resp = mydownloadlink;
      extension = resp.substring(resp.length - 4);
      txt = mytxt;
    });

    if(extension==".mp4"){
    _controller = VideoPlayerController.network(resp)..initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {});
    });
    }
    print(extension);
    //print(" Splitted : " + splitted.toString());

    // FileDownloader.downloadFile(url:mydownloadlink,
    //
    //     onDownloadCompleted: (path){

    // });

    //resp = response.body.toString();
    //print(response.body.toString());
    //print(Twitter.fromJson(json.decode(response.body)));
  }

  // void respond(String link){
  //   var tweet = TwitterExtractor.extract(link);
  //   print(TwitterExtractor.getUsername(link));
  //   //print(Twitter.fromJson(json.decode(tweet.toString())));
  //   var trimmed = tweet.toString().split(',');
  //   print(trimmed);
  //
  //
  //   //{"videos":[{"source":"Twitter for iPhone","text":"Sofascore Top 5 European Leagues , Team Of The Month For February 2023\n\n\u2705 Leo Messi - 8.58 \ud83d\udc10 https:\/\/t.co\/lrKlxMQ87t","thumb":"http:\/\/pbs.twimg.com\/media\/FqJKR9WWcAIRlyj.jpg","duration":0,"type":"image","bitrate":0,"url":"http:\/\/pbs.twimg.com\/media\/FqJKR9WWcAIRlyj.jpg","size":121471}],"state":"success"}
  //   var urls = <String>[];
  //
  // }

  void respond(String link) async {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      isFirstTime = false;
      uname = getUsername(link);
    });
    await extract(link);
    print(getUsername(link));
    print("RESP " + resp);
    //print(Twitter.fromJson(json.decode(tweet.toString())));
    //var trimmed = resp.toString().split(',');
    //print(trimmed);

    //{"videos":[{"source":"Twitter for iPhone","text":"Sofascore Top 5 European Leagues , Team Of The Month For February 2023\n\n\u2705 Leo Messi - 8.58 \ud83d\udc10 https:\/\/t.co\/lrKlxMQ87t","thumb":"http:\/\/pbs.twimg.com\/media\/FqJKR9WWcAIRlyj.jpg","duration":0,"type":"image","bitrate":0,"url":"http:\/\/pbs.twimg.com\/media\/FqJKR9WWcAIRlyj.jpg","size":121471}],"state":"success"}
    //var urls = <String>[];
  }

  void DownloadMedia(String link) {
    try {
      FileDownloader.downloadFile(
          url: link,
          onDownloadCompleted: (path) {
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
    } catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Unexpected Error : " + e.toString()),
          content: Text("Download Failed"),
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
  }

  Future<void> _downloadImage(imageUrl, fileName) async {

    try {
      final response = await http.get(Uri.parse(imageUrl));

      // Get the image name
      final imageName = path.basename(imageUrl);
      // Get the document directory path
      final appDir = (await DownloadsPath.downloadsDirectory())?.path;

      // This is the saved image path
      // You can use it to display the saved image later
      final localPath = path.join(appDir!, imageName);

      // Downloading
      final imageFile = File(localPath);
      await imageFile.writeAsBytes(response.bodyBytes);
      print(localPath);
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Download Completed"),
          content: Text("Image Downloaded Successfully"),
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
    }catch(Exception){
      print(Exception);
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Unexpected Error : " + Exception.toString()),
          content: Text("Download Failed"),
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

  }

  late VideoPlayerController _controller;

  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        "https://video.twimg.com/ext_tw_video/1634027653534474243/pu/vid/292x270/fLUTqlVynx2nx2Uv.mp4")..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  String input = "";
  TextEditingController UrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Twitter'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: UrlController,
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          onChanged: (text) {
                            input = text;
                            print('First text field: $text');
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                UrlController.clear();
                              },
                              icon: Icon(Icons.clear),
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Enter the URL of the Twitter post',
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      InkWell(
                        //onTap: () => getresponse(input),
                        onTap: (){ respond(input);
                          print("Connection Status:${ht.window.navigator.onLine}");},
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                extension == ".mp4"
                    ? resp.length != 0
                        ? Column(
                            children: [
                              Padding(
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
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Credits : " + uname,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.deepOrange),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(txt,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                    ),
                                  ],
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
                              ElevatedButton(
                                  onPressed: () {
                                    DownloadMedia(resp);
                                  },
                                  child: Text(
                                    "Download",
                                    style: TextStyle(fontSize: 15),
                                  )),
                            ],
                          )
                        : isFirstTime
                            ? Text("")
                            : Text("Invalid Link")
                    : resp.length != 0
                        ? Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 4,
                                    ),
                                  ),
                                  child: Image.network(resp)),
                              Text(txt,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              ElevatedButton(
                                  onPressed: () {
                                    _downloadImage(resp,"myfile");
                                  },
                                  child: Text(
                                    "Download",
                                    style: TextStyle(fontSize: 15),
                                  ))
                            ],
                          )
                        : isFirstTime
                            ? Text("")
                            : Text("Invalid Link")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
