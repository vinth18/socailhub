import '../provider/navigation_provider.dart';
import '../widget/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:build_context_provider/build_context_provider.dart';
import '../page/music.dart';
import '../page/youtube.dart';
import '../page/facebook.dart';
import '../page/instagram.dart';
import '../page/twitter.dart';
import 'package:lottie/lottie.dart';
// import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static final String title = 'Social Hub';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primarySwatch: Colors.deepOrange),
          home: MainPage(),
        ),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final buildContextProvider = BuildContextProvider();
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(Home.title),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Divider(color: Colors.black),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20.0,
                        ),
                      ],
                      color: const Color(0xffF55050),
                      border: Border.all(
                          color: Color.fromARGB(255, 182, 3, 3), width: 5),
                      borderRadius: BorderRadius.circular(70)),
                  child: CarouselSlider(
                      items: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black),
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Row(
                                    children: [
                                      //Image.asset('assets/images/youtube_1.jpg',fit: BoxFit.contain,height: 200,),
                                      Lottie.asset(
                                        'assets/images/you1.json',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        fit: BoxFit.fill,
                                      ),
                                      //Lottie.network('https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Text(
                                            "Download Any\nYoutube Videos In\nSeconds...",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: ElevatedButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xffE21818),
                                                  shape: StadiumBorder()),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Youtube()),
                                                );
                                              },
                                              child: Text(
                                                'Go',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black),
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Row(
                                    children: [
                                      //Image.asset('assets/images/youtube_1.jpg',fit: BoxFit.contain,height: 200,),
                                      Lottie.asset(
                                        'assets/images/you2.json',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        fit: BoxFit.fill,
                                      ),
                                      //Lottie.network('https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Text(
                                            "Download Any\nYoutube Videos In\nSeconds...",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: ElevatedButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xffE21818),
                                                  shape: StadiumBorder()),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Youtube()),
                                                );
                                              },
                                              child: Text(
                                                'Go',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black),
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Row(
                                    children: [
                                      //Image.asset('assets/images/youtube_1.jpg',fit: BoxFit.contain,height: 200,),
                                      Lottie.asset(
                                        'assets/images/you3.json',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        fit: BoxFit.fill,
                                      ),
                                      //Lottie.network('https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Text(
                                            "Download Any\nYoutube Videos In\nSeconds...",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: ElevatedButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xffE21818),
                                                  shape: StadiumBorder()),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Youtube()),
                                                );
                                              },
                                              child: Text(
                                                'Go',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        height: 250,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1.0,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      )),
                ),
              ),
              Divider(color: Colors.black),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffE384FF),
                      border: Border.all(color: Colors.black, width: 5),
                      borderRadius: BorderRadius.circular(70)),
                  child: CarouselSlider(
                      items: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black),
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Row(
                                    children: [
                                      //Image.asset('assets/images/youtube_1.jpg',fit: BoxFit.contain,height: 200,),
                                      Lottie.asset(
                                        'assets/images/insta2.json',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        fit: BoxFit.fill,
                                      ),
                                      //Lottie.network('https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Text(
                                            "Download Instagram\nPosts & Reels In\nSeconds...",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: ElevatedButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xffA61F69),
                                                  shape: StadiumBorder()),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Instagram()),
                                                );
                                              },
                                              child: Text(
                                                'Go',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black),
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Row(
                                    children: [
                                      //Image.asset('assets/images/youtube_1.jpg',fit: BoxFit.contain,height: 200,),
                                      Lottie.asset(
                                        'assets/images/insta4.json',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        fit: BoxFit.fill,
                                      ),
                                      //Lottie.network('https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Text(
                                            "Download Instagram\nPosts & Reels In\nSeconds...",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: ElevatedButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xffA61F69),
                                                  shape: StadiumBorder()),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Instagram()),
                                                );
                                              },
                                              child: Text(
                                                'Go',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black),
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Row(
                                    children: [
                                      //Image.asset('assets/images/youtube_1.jpg',fit: BoxFit.contain,height: 200,),
                                      Lottie.asset(
                                        'assets/images/insta3.json',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        fit: BoxFit.fill,
                                      ),
                                      //Lottie.network('https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Text(
                                            "Download Instagram\nPosts & Reels In\nSeconds...",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: ElevatedButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xffA61F69),
                                                  shape: StadiumBorder()),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Instagram()),
                                                );
                                              },
                                              child: Text(
                                                'Go',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        height: 250,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1.0,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      )),
                ),
              ),
              Divider(color: Colors.black),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      border: Border.all(color: Colors.black, width: 5),
                      borderRadius: BorderRadius.circular(70)),
                  child: CarouselSlider(
                      items: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black),
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Row(
                                    children: [
                                      //Image.asset('assets/images/youtube_1.jpg',fit: BoxFit.contain,height: 200,),
                                      Lottie.asset(
                                        'assets/images/fb1.json',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        fit: BoxFit.fill,
                                      ),
                                      //Lottie.network('https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Text(
                                            "Download Facebook\nPosts & Videos In\nSeconds...",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: ElevatedButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xff13005A),
                                                  shape: StadiumBorder()),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Facebook()),
                                                );
                                              },
                                              child: Text(
                                                'Go',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black),
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Row(
                                    children: [
                                      //Image.asset('assets/images/youtube_1.jpg',fit: BoxFit.contain,height: 200,),
                                      Lottie.asset(
                                        'assets/images/fb2.json',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        fit: BoxFit.fill,
                                      ),
                                      //Lottie.network('https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Text(
                                            "Download Facebook\nPosts & Videos In\nSeconds...",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: ElevatedButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xff13005A),
                                                  shape: StadiumBorder()),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Facebook()),
                                                );
                                              },
                                              child: Text(
                                                'Go',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black),
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Row(
                                    children: [
                                      //Image.asset('assets/images/youtube_1.jpg',fit: BoxFit.contain,height: 200,),
                                      Lottie.asset(
                                        'assets/images/fb3.json',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        fit: BoxFit.fill,
                                      ),
                                      //Lottie.network('https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Text(
                                            "Download Facebook\nPosts & Videos In\nSeconds...",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: ElevatedButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xff13005A),
                                                  shape: StadiumBorder()),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Facebook()),
                                                );
                                              },
                                              child: Text(
                                                'Go',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black),
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Row(
                                    children: [
                                      //Image.asset('assets/images/youtube_1.jpg',fit: BoxFit.contain,height: 200,),
                                      Lottie.asset(
                                        'assets/images/fb5.json',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        fit: BoxFit.fill,
                                      ),
                                      //Lottie.network('https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Text(
                                            "Download Facebook\nPosts & Videos In\nSeconds...",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: ElevatedButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xff13005A),
                                                  shape: StadiumBorder()),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Facebook()),
                                                );
                                              },
                                              child: Text(
                                                'Go',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        height: 250,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1.0,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      )),
                ),
              ),
              Divider(color: Colors.black),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff86E5FF),
                      border: Border.all(color: Colors.black, width: 5),
                      borderRadius: BorderRadius.circular(70)),
                  child: CarouselSlider(
                      items: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black),
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Row(
                                    children: [
                                      //Image.asset('assets/images/youtube_1.jpg',fit: BoxFit.contain,height: 200,),
                                      Lottie.asset(
                                        'assets/images/twi2.json',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        fit: BoxFit.fill,
                                      ),
                                      //Lottie.network('https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Text(
                                            "Download Twitter\nPosts & Videos In\nSeconds...",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: ElevatedButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xff0081C9),
                                                  shape: StadiumBorder()),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Home_Twitter()),
                                                );
                                              },
                                              child: Text(
                                                'Go',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black),
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Row(
                                    children: [
                                      //Image.asset('assets/images/youtube_1.jpg',fit: BoxFit.contain,height: 200,),
                                      Lottie.asset(
                                        'assets/images/twi2.json',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        fit: BoxFit.fill,
                                      ),
                                      //Lottie.network('https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Text(
                                            "Download Twitter\nPosts & Videos In\nSeconds...",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: ElevatedButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xff0081C9),
                                                  shape: StadiumBorder()),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Home_Twitter()),
                                                );
                                              },
                                              child: Text(
                                                'Go',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        height: 250,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1.0,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      )),
                ),
              ),
              Divider(color: Colors.black),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff68B984),
                      border: Border.all(color: Colors.black, width: 5),
                      borderRadius: BorderRadius.circular(70)),
                  child: CarouselSlider(
                      items: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black),
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Row(
                                    children: [
                                      //Image.asset('assets/images/youtube_1.jpg',fit: BoxFit.contain,height: 200,),
                                      Lottie.asset(
                                        'assets/images/music1.json',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        fit: BoxFit.fill,
                                      ),
                                      //Lottie.network('https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Text(
                                            "Download Any\nMusic In Seconds\nFor Free...",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: ElevatedButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xff285430),
                                                  shape: StadiumBorder()),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Music()),
                                                );
                                              },
                                              child: Text(
                                                'Go',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black),
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Row(
                                    children: [
                                      //Image.asset('assets/images/youtube_1.jpg',fit: BoxFit.contain,height: 200,),
                                      Lottie.asset(
                                        'assets/images/music2.json',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        fit: BoxFit.fill,
                                      ),
                                      //Lottie.network('https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Text(
                                            "Download Any\nMusic In Seconds\nFor Free...",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: ElevatedButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xff285430),
                                                  shape: StadiumBorder()),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Music()),
                                                );
                                              },
                                              child: Text(
                                                'Go',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black),
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Row(
                                    children: [
                                      //Image.asset('assets/images/youtube_1.jpg',fit: BoxFit.contain,height: 200,),
                                      Lottie.asset(
                                        'assets/images/music3.json',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        fit: BoxFit.fill,
                                      ),
                                      //Lottie.network('https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Text(
                                            "Download Any\nMusic In Seconds\nFor Free...",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: ElevatedButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xff285430),
                                                  shape: StadiumBorder()),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Music()),
                                                );
                                              },
                                              child: Text(
                                                'Go',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black),
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Row(
                                    children: [
                                      //Image.asset('assets/images/youtube_1.jpg',fit: BoxFit.contain,height: 200,),
                                      Lottie.asset(
                                        'assets/images/music_5.json',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        fit: BoxFit.fill,
                                      ),
                                      //Lottie.network('https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Text(
                                            "Download Any\nMusic In Seconds\nFor Free...",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: ElevatedButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xff285430),
                                                  shape: StadiumBorder()),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Music()),
                                                );
                                              },
                                              child: Text(
                                                'Go',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        height: 250,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1.0,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      )),
                ),
              ),
              Divider(color: Colors.black),
            ],
          ),
          const ListenerThatRunsFunctionsWithBuildContext(),
        ],
      ),
    );
  }
}
