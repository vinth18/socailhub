import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../controller/insta_download_posts.dart';
import '../controller/insta_profile.dart';
import '../controller/insta_download.dart';
import '../home.dart';
import 'package:lottie/lottie.dart';


void main() {
  runApp(const Instagram());
}

class Instagram extends StatelessWidget {
  const Instagram({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Instagram'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  late TabController _tabController;
  int _currentPosition=0;

  final _pages = [
    Insta_Profile(),
    //Insta_Download_posts(),
    Insta_Download(),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 15,
        centerTitle: true,
        backgroundColor: Color(0xffF350F5),
        leading: IconButton(
          onPressed: () {Navigator.of(context, rootNavigator: true).pop(context);},
          icon: Icon(Icons.arrow_back),
        ),
        title:Text("Instagram"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(200),bottomRight: Radius.circular(200))
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.125),
          child: Container(
            child: Lottie.asset('assets/images/insta2.json',width: MediaQuery.of(context).size.width*0.3,
              height: MediaQuery.of(context).size.height*0.125,
              fit: BoxFit.fill,),
          ),
        ),
        // leading: BackButton(
        //   color: Colors.white,
        //   onPressed: (){
        //     SystemNavigator.pop();
        //     Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
        //   },
        // ),

        // bottom: TabBar(
        //   controller: _tabController,
        //   tabs: [
        //     Tab(
        //       icon: Icon(Icons.info),
        //       text: "Profile",
        //     ),
        //     // Tab(
        //     //   icon: Icon(Icons.image),
        //     //   text: "Download Posts",
        //     // ),
        //     Tab(
        //       icon: Icon(Icons.download),
        //       text: "Download Reels",
        //     ),
        //   ],
        //   onTap: (position){
        //     setState(() {
        //       _currentPosition = position;
        //       print(position);
        //     });
        //   },
        // ),
      ),
      //drawer: Drawer(),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Divider(
              color: Colors.black
          ),
          Container(
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                //SizedBox(height: 20.0),
                DefaultTabController(
                    length: 2, // length of tabs
                    initialIndex: 0,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                      Container(
                        child: TabBar(
                          indicatorColor: Color(0xffF350F5),
                          controller: _tabController,
                          labelColor: Color(0xffE400C0),
                          unselectedLabelColor: Colors.black,
                          tabs: [
                                Container(
                                  margin: const EdgeInsets.all(5.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      color: Color(0xffF3B8F4),
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height/8,
                                  child: Tab(
                                    icon: Icon(Icons.person_outline_outlined,color: Colors.white,),
                                    text: "Profile",
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(5.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      color: Color(0xffF3B8F4),
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height/8,
                                  child: Tab(
                                    icon: Icon(Icons.video_camera_back_outlined,color: Colors.white,),
                                    text: "Download Reels",
                                  ),
                                ),
                          ],
                            onTap: (position){
                              setState(() {
                                _currentPosition = position;
                                print(position);
                              });
                            },
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.7, //height of TabBarView
                          decoration: BoxDecoration(
                              border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                          ),
                          child: TabBarView(children: <Widget>[
                            Container(
                              child: Center(
                                child: _pages[_currentPosition],
                              ),
                            ),
                            Container(
                              child: Center(
                                child: _pages[_currentPosition],
                              ),
                            ),
                          ])
                      )
                    ])
                ),
              ]),
            ),],
      ),
    );
  }

}
