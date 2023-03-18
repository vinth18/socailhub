import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:facebook_video_download/facebook_video_download.dart';

// import 'package:facebook_video_download/facebook_video_download.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:beautiful_soup_dart/beautiful_soup.dart';

/*
class Facebook extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Facebook'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
      );
}
*/

class Facebook extends StatefulWidget {
  @override
  _FacebookDownloaderScreenState createState() =>
      _FacebookDownloaderScreenState();
}

class _FacebookDownloaderScreenState extends State<Facebook> {
  TextEditingController urlController = TextEditingController();

  late String link = urlController.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text('Facebook Downloader'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 300,
                child: TextField(
                  controller: urlController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: (){urlController.clear();},
                      icon: Icon(Icons.clear),
                    ),
                    hintText: 'Enter the URL of the Facebook post',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: TextButton.styleFrom(backgroundColor: Colors.indigo),
              onPressed: () {
                print(link);
                //getresponse();
                downloadVideo(link);
                //FacebookDownloader.downloadPost(link);
              },
              child: Text('Download'),
            ),
          ],
        ),
      ),
    );
  }

  // void getresponse() async {
  //   FacebookPost data = await FacebookData.postFromUrl("https://www.facebook.com/watch/?v=135439238028475");
  //   print(data.postUrl);
  //   print(data.videoHdUrl);
  //   print(data.videoMp3Url);
  //   print(data.videoSdUrl);
  //   print(data.commentsCount);
  //   print(data.sharesCount);
  // }


  void download(String link) async {
    var url = 'https://www.facebook.com/video/video.php?v=iYds5rKiHq'; // Replace VIDEO_ID with the actual video ID
    var response = await http.get(Uri.parse(url));
    print(response.bodyBytes);
    final file = File('/storage/emulated/0/Download/facebook_video.mp4');
    //var file = File('video.mp4');
    await file.writeAsBytes(response.bodyBytes);
    print('Video downloaded successfully!');
    downloadVideo(link);
  }

  Future<void> downloadVideo(String link) async { //insta method
    var linkEdit = link.replaceAll(" ", "").split("/");
    var downloadURL = await http.Client().get(Uri.parse('${linkEdit[0]}//${linkEdit[2]}/${linkEdit[3]}/${linkEdit[4]}' + "?__a=1&__d=dis"));
    BeautifulSoup bs = BeautifulSoup(downloadURL.body);
    print(bs);
    print(bs.findAll("link")[1]);
    int indexofhref = bs.findAll("link")[1].toString().indexOf("https");
    int length = bs.findAll("link")[1].toString().length;
    String downloadlink = bs.findAll("link")[1].toString().substring(indexofhref,length-2);
    print(downloadlink);

    FileDownloader.downloadFile(url: downloadlink.trim(),
        onDownloadCompleted: (path){
          print(path);

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
  }

}

// class FacebookDownloader {
//   static bool pressed = false;
//   static bool downloading = false;
//   static int i = 1;
//
//   static void downloadPost(String postUrl) async {
//     final response = await http.Client().get(Uri.parse(postUrl));
//     String res = response.body.toString();
//     //var arr = res.split("link rel=\"alternate\" hreflang=\"af\" href=");
//     var arr = res.split("link rel=\"alternate\" hreflang=\"x-default\" href=");
//     print(res);
//     var mylink = arr[1].split("/>")[0];
//     print("mylink" + mylink);
//     mylink = mylink.replaceAll("\"", "");
//     print("NEW MYLINK : " + mylink);
//
//
//     // final document = parser.parse(response.body);
//     // print(document.toString());
//     // final videoUrl = document.querySelector('meta[property="og:video"]')?.attributes['content'];
//     // print(videoUrl);
//     var VideoUrl = mylink;
//     if (VideoUrl == null) {
//       throw Exception('Could not find video URL');
//     }
//
//     // final directory = await getExternalStorageDirectory();
//     // final path = directory!.path;
//     // final file = File('/storage/emulated/0/Download/facebook_video.mp4');
//     // print(file);
//     // final videoResponse = await http.get(Uri.parse(VideoUrl));
//     // await file.writeAsBytes(videoResponse.bodyBytes);
//     // print("SUCCESS");
//
//     //String name = "fb_" + i.toString();
//     FileDownloader.downloadFile(url: postUrl,onDownloadCompleted: (path){
//           print(path);
//     //       // setState(() {
//     //       //   i++;
//     //       //   downloading = false;
//     //       //   pressed = false;
//     //       // });
//         });
//   }
//
// }




