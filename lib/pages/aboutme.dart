import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_practice/helper/appController.dart';
import 'package:flutter_web_practice/helper/util/appStyle.dart';
import 'package:flutter_web_practice/widget/infocard.dart';
import 'package:get/get.dart';

class AboutMe extends StatelessWidget {
   AboutMe({super.key});
AppController _appController=Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Column(
            children: [
               Text(
                'About Me',
                style: h0,
              ),
               Text(
                'Get To Know More',
                style: small,
              ),
              const SizedBox(height: 8),

              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 1,),
                  // Image Section
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      'assets/profile.jpg', // Replace with your image URL
                      width: 250,
                      height: Get.height*0.34,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 40),
                  // Information Cards Section
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [

                        Text(_appController.aboutMe.value,textAlign: TextAlign.justify,style: p1,),
                         SizedBox(height: Get.height*0.03),
                        Row(
                          children: [
                            const Expanded(
                              child: InfoCard(
                                title: 'Experience',
                                subtitle: '3 years',
                                description: '',
                                icon: Icons.work_outline,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.01,
                            ),
                            const Expanded(
                              child: InfoCard(
                                title: 'Education',
                                subtitle:
                                'BS Computer Science',
                                description: '',
                                icon: Icons.school_outlined,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex: 1,),

                ],
              ),
              // Description

            ],
          ),
        ),
      ],
    );
  }
}
