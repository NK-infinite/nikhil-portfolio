import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:animated_background/animated_background.dart';
import 'package:animated_background/particles.dart'; // ✅ FIXED MISSING IMPORT
import 'package:nikhil_portfolio/Rest_Api_project.dart';
import 'package:nikhil_portfolio/messenger.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';

class PortfolioHome extends StatefulWidget {
  @override
  _PortfolioHomeState createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> with SingleTickerProviderStateMixin {
  final Uri _githubUrl = Uri.parse("https://github.com/NK-infinite");
  final Uri _linkedinUrl = Uri.parse("https://www.linkedin.com/in/nikhil-keshvala-985786327/");
  final Uri _emailUrl = Uri.parse("mailto:nikhilkeshvala1@gmail.com?subject=Hello&body=Hi");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBackgroundEffect(),
          Padding(
            padding: const EdgeInsets.only(left: 10,right:10 ),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: FadeInDown(
                      duration: Duration(seconds: 1),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage("assets/images/nikhil.png"),
                            //child: Image.asset("assets/images/nikhil.png"),
                          ),
                          SizedBox(height: 15),
                          Text("Hey, I'm Nikhil!", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.white)),
                          Text("Flutter Developer | Front-end Developer", style: TextStyle(fontSize: 22, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  FadeInLeft(
                    duration: Duration(seconds: 1),
                    child: Row(
                      children: [
                        Image.asset("assets/images/graduated.png", height: 25),
                        Text(" Education:", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.white)),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.white,

                    margin: EdgeInsets.symmetric(vertical: 12),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Container(
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("BSc in Information Technology", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.black)),
                            Text("Sarvajanik University (2024 - 2028)", style: TextStyle(fontSize: 18, color: Colors.black)),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 12),
                    child: Padding(

                      padding: EdgeInsets.all(16),
                      child: Container(

                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Relevant Courses:", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                            Text("• Database Management Systems (SQL, PL/SQL)", style: TextStyle(fontSize: 16)),
                            Text("• Object-Oriented Programming (Java,)", style: TextStyle(fontSize: 16)),
                            Text("• Web Development (HTML, CSS, JavaScript,)", style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                  ),
SizedBox(height: 50,),

                  FadeInLeft(
                    duration: Duration(seconds: 1),
                    child: Row(
                      children: [
                        Image.asset("assets/images/skill.png",height: 25,),
                        Text(" Skills:", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.white)),
                      ],
                    ),
                  ),
                  Wrap(
                    spacing: 12,
                    runSpacing: 10,
                    children: [
                      Card(                    color: Colors.white,
                      child: _buildSkillChip("Flutter")),
                      Card(                    color: Colors.white,
                          child: _buildSkillChip("Dart")),
                      Card(                    color: Colors.white,
                          child: _buildSkillChip("Firebase")),
                      Card(                    color: Colors.white,
                          child: _buildSkillChip("REST APIs")),
                    ],
                  ),
                  SizedBox(height: 50),

                  FadeInRight(
                    duration: Duration(seconds: 1),
                    child: Row(
                      children: [
                        Image.asset("assets/images/start-up.png",height: 25,),
                        Text(" Projects:", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.white)),
                      ],
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RestApi())
                        );
                      },
                      child:_buildProjectTile("Rest Api project ", "A productivity app to manage tasks & schedules."),),

                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Messenger())
                        );
                      },
                      child: _buildProjectTile("Messenger App", "A real-time chat app using Flutter & Firebase.")),
                  SizedBox(height: 50),
                  FadeInUp(
                    duration: Duration(seconds: 1),
                    child: Row(
                      children: [
                        Image.asset("assets/images/contact-us.png",height: 25,),
                        Text(" Contact Me:", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.white)),
                      ],
                    ),
                  ),
                  _buildContactButton("GitHub", _githubUrl, "assets/images/Octicons-mark-github.svg.png"),
                  _buildContactButton("LinkedIn", _linkedinUrl, "assets/images/LinkedIn_icon.png"),
                  _buildContactButton("Email", _emailUrl, "assets/images/gmail.png"),

                  SizedBox(height: 50),
                  Center(
                    child: FadeIn(
                      duration: Duration(seconds: 1),
                      child: Text(
                        "Made with ❤️ in Flutter",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(
      label: Text(skill, style: TextStyle(fontSize: 18, color: Colors.black)),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildProjectTile(String title, String description) {
    return FadeInLeft(
      duration: Duration(milliseconds: 800),
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 12),
        child: ListTile(
          title: Text(title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          subtitle: Text(description, style: TextStyle(fontSize: 18)),
          trailing: Icon(Icons.arrow_forward, color: Colors.blueAccent, size: 28),
        ),
      ),
    );
  }

  Widget _buildContactButton(String label, Uri url, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,),
      child: ZoomIn(

        duration: Duration(milliseconds: 800),
        child: ElevatedButton(

          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 28),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: () async {
            if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
              print("Could not launch $url");
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(imagePath, height: 30), // 🖼️ Add your image here
              SizedBox(width: 10), // Spacing between image & text
              Text(label, style: TextStyle(fontSize: 22)),
            ],
          ),
        ),
      ),
    );
  }


}


class AnimatedBackgroundEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.indigo], // 🔥 Yeh do colors mix honge
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
