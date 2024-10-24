import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_practice/helper/util/appImages.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helper/util/appStyle.dart';

class Home extends StatelessWidget {
   Home({super.key});

  RxBool isDownloadHover=false.obs;
  RxBool isContactHover=false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset('assets/profile.jpg',
              height: 400,
              ),
            ),
          ),
          SizedBox(width: Get.width*0.04,),
          Column(
              mainAxisSize: MainAxisSize.min,
              children: [
            // Text Content
             Center(
              child: Column(
                children: [
                   Text(
                    'Hello, I\'m',
                    style: small,
                  ),
                  Text(
                    'Muhammad Farman',
                    style: h0
                  ),
                  Text(
                    'Flutter Mobile Application Developer',
                    style: small
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Buttons
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onHover: (isHover){
                      isDownloadHover.value=isHover;
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(isDownloadHover.value? Color(0xFF0866FC):Color(0xFF0866FC)),
                      side: MaterialStateProperty.all(
                        BorderSide(color: isDownloadHover.value?Colors.white: Color(0xFF0866FC)), // Set border color
                      ),
                      overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.2)), // Ripple effect color
                    ),
                    onPressed: () async {
                      final url = 'https://drive.google.com/uc?id=1urnZWYmF6B0O-DSkrT3MM2TzcVY6GGl7'; // Use the direct download link
                      if (await canLaunch(url)) {
                      await launchUrl(Uri.parse(url));
                      } else {
                      throw 'Could not launch $url';
                      }
                    },
                    child:  Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child:  Text(
                        'Download CV',
                        style: btnTxt,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  OutlinedButton(
                    onPressed: () {},
                    onHover: (isHover){
                      isContactHover.value=isHover;
                    },
                    style: ButtonStyle(
                      backgroundColor:MaterialStateProperty.all(isContactHover.value? const Color(0xFF0866FC):Colors.white)     ,
                      side: MaterialStateProperty.all(
                         BorderSide(color: isContactHover.value?Colors.white: Color(0xFF0866FC)), // Set border color
                      ),
                    ),
                    child:  Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'Contact Info',
                        style:  btnTxt.copyWith(color: isContactHover.value?Colors.white: Color(0xFF0866FC)) , // Set text color
                      ),
                    ),
                  ),

                ],
              ),
            ),
                SizedBox(height: Get.height*0.02,),
                Row(children: [SvgPicture.asset(AppImages.linkedin,height: 28,),SizedBox(width: Get.height*0.03,),SvgPicture.asset(AppImages.github,height: 28,),],)
          ]),
        ],
      ),
    );
  }
}
