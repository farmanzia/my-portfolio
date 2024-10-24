import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_practice/helper/util/appImages.dart';
import 'package:flutter_web_practice/helper/util/appStyle.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Get in touch",style: small.copyWith(color: Colors.black),),
        Text("Contact Me",style: h0,),
        SizedBox(height: Get.height*0.02,),
        Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black.withOpacity(0.2))),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () async {
                      final Uri emailUri = Uri(
                        scheme: 'mailto',
                        path: 'farmanzia96@gmail.com',
                      );
                      if (await canLaunch(emailUri.toString())) {
                      await launchUrl(Uri.parse(emailUri.toString()));
                      } else {
                      throw 'Could not launch $emailUri';
                      }
                    },
                    child: Row(
                      children: [
                        Icon(Icons.mail_outline), Text("  farmanzia96@gmail.com",style: h2,),
                      ],
                    ),
                  ),


                  SizedBox(
                    width: Get.width * 0.04,
                  ),
                  InkWell(
                    onTap: () async {
                      const url = 'https://www.linkedin.com/in/muhammad-farman-flutter-dev/';
                      if (await canLaunch(url)) {
                      await launchUrl(Uri.parse(url),browserConfiguration: BrowserConfiguration());
                      } else {
                      throw 'Could not launch $url';
                      }
                    },
                    child: Row(children: [ SvgPicture.asset(AppImages.linkedin,height: 22,),
                      Text("  https://www.linkedin.com/in/muhammad-farman-flutter-dev/",style: h2,),
                    ],),
                  )
                  ],
              ),
            ),
          ),
        ),
        SizedBox(height: Get.height*0.03,),

      ],
    );
  }
}
