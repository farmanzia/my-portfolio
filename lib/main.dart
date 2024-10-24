import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_web_practice/helper/util/appStyle.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'pages/aboutme.dart';
import 'pages/contactme.dart';
import 'pages/experience.dart';
import 'pages/projects.dart';
import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Muhammad Farman',
      debugShowCheckedModeBanner: false,
      home: PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  PortfolioPageState createState() => PortfolioPageState();
}

class PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();

  // Observable hover state for each section
  final RxMap<String, bool> _isHovered = {
    'Home': false,
    'About Me': false,
    'Experience': false,
    'Projects': false,
    'Contact': false,
  }.obs;

  // Map sections to their scroll positions
  final Map<String, double> _sectionPositions = {
    'Home': 0,
    'About Me': 600,
    'Experience': 1200,
    'Projects': 1800,
    'Contact': 2400,
  };

  void _scrollToSection(String section) {
    final position = _sectionPositions[section] ?? 0;
    _scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: const Color(0xFF0866FC), // Facebook primary blue color
        elevation: 0, // Disable elevation to prevent any shadow
        actions: [
          // Navbar items
          for (var section in _sectionPositions.keys)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Obx(
                    () => Column(
                  children: [
                    TextButton(
                      isSemanticButton: false,
                      style: ButtonStyle(
                        splashFactory: NoSplash.splashFactory,
                        foregroundColor: MaterialStateProperty.all(Colors.transparent),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () => _scrollToSection(section),
                      onHover: (val) {
                        _isHovered[section] = val;
                        log("Hovered over: $section");
                      },
                      child: Column(
                        children: [
                          Text(
                            section,
                            style: small.copyWith(color: Colors.white)
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: _isHovered[section]! ? Colors.white : null,
                      height: 0.3,
                      width: section.length * 8.0,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Each section widget with different content
            _buildSection('', Colors.white,  Home()),
            _buildSection('About Me', Colors.blue.withOpacity(0.05), AboutMe()),
            _buildSection('', Colors.grey.shade50, ExperienceDetailsPage()),
            _buildSection('', Colors.blue.withOpacity(0.06), Projects()),
            _buildSection('Contact', Colors.blue, Contact()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final url = 'https://drive.google.com/uc?id=1urnZWYmF6B0O-DSkrT3MM2TzcVY6GGl7'; // Use the direct download link
          if (await canLaunch(url)) {
          await launchUrl(Uri.parse(url));
          } else {
          throw 'Could not launch $url';
          }
          // Action for downloading the resume
        },
        backgroundColor: Colors.black,
        icon: const Icon(Icons.download, color: Colors.white),
        label: const Text(
          'Resume',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // Helper function to create sections
  Widget _buildSection(String title, Color color, Widget widget) {
    log("==== widget ${widget==Contact}");
    return Container(
      height:title=="Contact"?240: 600,
      color: color,
      child: Column(
        children: [
          SizedBox(height: Get.height*0.05,),
          Expanded(child: widget),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
