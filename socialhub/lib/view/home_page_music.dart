import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:onboarding_app/controller/data_provider_music.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isFirstTime = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        centerTitle: true,
        //backgroundColor: Color(0xffDF2E38),
        backgroundColor: Color(0xff68B984),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(200),
                bottomRight: Radius.circular(200))),
        bottom: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.125),
          child: Container(
            child: Lottie.asset(
              'assets/images/music2.json',
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.125,
              fit: BoxFit.fill,
            ),
          ),
        ),
        title: Text('Music'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
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
                                style: TextStyle(color: Colors.black),
                                cursorColor: Colors.black,
                                controller: controller.UrlController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xff68B984),
                                  prefixIcon: Icon(Icons.insert_link_outlined),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.UrlController.clear();
                                    },
                                    icon: Icon(Icons.clear),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35)
                                      //borderSide: BorderSide(color: Colors.green)
                                      ),
                                  hintText: 'Enter URL of the Music',
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        controller.progress = 0;
                        isFirstTime = false;
                        controller.getVideeoInfo(controller.UrlController.text);
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 25.0,
                            ),
                          ],
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 35,
                          shadows: <Shadow>[
                            Shadow(color: Colors.black, blurRadius: 0.5)
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    Divider(
                      color: Colors.black,
                    ),
                    controller.videoID.isEmpty
                        ? Text('')
                        : Container(
                            child: Image.network(
                                'https://img.youtube.com/vi/${controller.videoID}/0.jpg',
                                scale: 2.0),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.green, width: 4),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        controller.videoTitle,
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
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
                                icon: Icon(
                                  Icons.download,
                                  color: Colors.green,
                                ),
                                label: Text(
                                  'Download Audio',
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ],
                          ),
                    !isFirstTime
                        ? !controller.videoID.isEmpty
                            ? controller.progress > 0
                                ? Column(
                                    children: [
                                      Text(
                                          '${controller.progress == 2 ? '100' : (controller.progress * 100).toInt()} %',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(height: 12),
                                      LinearProgressIndicator(
                                        value: controller.progress,
                                        backgroundColor: Colors.grey,
                                        valueColor:
                                            const AlwaysStoppedAnimation<Color>(
                                                Colors.green),
                                      ),
                                    ],
                                  )
                                : Text('')
                            : Center(
                                child: Text(
                                "Invalid Link",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ))
                        : Lottie.asset(
                            'assets/images/music_5.json',
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.250,
                            fit: BoxFit.fill,
                          ),
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
