import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:nikhil_portfolio/Portfolio.dart';

class RestApi extends StatefulWidget {
  const RestApi({super.key});

  @override
  State<RestApi> createState() => _RestApiState();
}

class _RestApiState extends State<RestApi> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/Screen_recording_20250305_170158.mp4")
      ..initialize().then((_) {
        setState(() {});
      }).catchError((error) {
        print("Video load error: $error");
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
     // backgroundColor: Colors.transparent,
        appBar:  AppBar(
          title: Center(child: Text("Rest Api", style: TextStyle(color: Colors.black,fontSize: 40))),
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),

      body: Stack(
        children: [
          AnimatedBackgroundEffect(),
          Padding(
            padding: const EdgeInsets.only(top: 70,left: 20,right: 20),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      child: Container(
                        height: 600,
                        width: 500,
                        decoration: BoxDecoration(borderRadius:
                        BorderRadius.circular(15),
                        color: Colors.white70,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            _controller.value.isInitialized
                                ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              ),
                            )
                                : Center(child: CircularProgressIndicator()),

                            IconButton(
                              icon: Icon(
                                _controller.value.isInitialized && _controller.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                size:50,
                                color:Colors.black,
                              ),
                              onPressed: () {
                                if (_controller.value.isInitialized) {
                                  setState(() {
                                    _controller.value.isPlaying ? _controller.pause() : _controller.play();
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                          Padding(
                padding: const EdgeInsets.only(top: 30,bottom: 20  ),
                child: Card(
                  child: Container(
                    height: 700,
                    width: 900,
                    decoration: BoxDecoration(
borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        // **Project Title
                          SizedBox(height: 50,),
                        Center(
                          child:Text(
                            "REST API Integration in Flutter",
                            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 40),

                        // **Project Description**
                          Text("Description",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          Text(
                            "This project demonstrates how to integrate REST APIs in Flutter.",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 40),
                          Text("Features",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          Text(
                            "✔ Fetch real-time data",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "✔ Parse JSON data",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "✔ Manage state efficiently",
                            style: TextStyle(fontSize: 16),
                          ),

                          SizedBox(height: 40),
                          Text("Technologies Used",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

                          Text(
                            "- Flutter (Dart)",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "- REST API",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "- HTTP package",
                            style: TextStyle(fontSize: 16),
                          ),

                          SizedBox(height: 40),

                          Text(
                            " Why This Project?",
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "This project is great for learning API integration in Flutter.",
                            style: TextStyle(fontSize: 16),
                          ),


                        ]
                      ),
                    )
                  )
                ),
                          )
                        ],
                      ),
              ),
            ),
          )
            ],
          ),

    );
  }
}
