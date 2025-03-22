import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nikhil_portfolio/Portfolio.dart';

class Messenger extends StatefulWidget {
  const Messenger({super.key});

  @override
  State<Messenger> createState() => _MessengerState();
}

class _MessengerState extends State<Messenger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Center(child: Text("Messenger App", style: TextStyle(color: Colors.black, fontSize: 40))),
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
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 📌 New Image Container (Alag Section)
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        width: 500,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Messenger Screenshots",
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Image.asset("assets/images/Screenshot_20250305_163527.png", fit: BoxFit.cover),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Image.asset("assets/images/Screenshot_20250305_163537.png", fit: BoxFit.cover),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Image.asset("assets/images/Screenshot_20250305_163547.png", fit: BoxFit.cover),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Image.asset("assets/images/Screenshot_20250305_163840.png", fit: BoxFit.cover),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // 📌 Project Details Section
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 20),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          width: 900,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                "Messenger App in Flutter",
                                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20),
                              Text("Description", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                              Text(
                                "This is a Flutter-based real-time messenger app with chat features.",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 20),
                              Text("Features", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                              Text("✔ Real-time messaging", style: TextStyle(fontSize: 16)),
                              Text("✔ Firebase backend", style: TextStyle(fontSize: 16)),
                              Text("✔ Group chats", style: TextStyle(fontSize: 16)),
                              SizedBox(height: 20),
                              Text("Technologies Used", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                              Text("- Flutter (Dart)", style: TextStyle(fontSize: 16)),
                              Text("- Firebase Firestore", style: TextStyle(fontSize: 16)),
                              Text("- Provider / Riverpod", style: TextStyle(fontSize: 16)),
                              SizedBox(height: 20),
                              Text("Why This Project?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                              Text(
                                "This project is perfect for learning real-time chat integration in Flutter.",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
