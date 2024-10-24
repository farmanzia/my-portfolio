import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../helper/util/appStyle.dart';

class ExperienceDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Center(
              child: Text(
                ' Experience',
                style: h0
              ),
            ),

            SizedBox(height: Get.height*0.08,),
            Row(
              children: [
                SizedBox(width: Get.width*0.1,),
                Expanded(

                  child: _buildExperienceCard(
                    companyName: 'Deviate Agency',
                    location: 'Lahore, Pakistan',
                    jobType: 'Full-Time',
                    designation: 'Flutter Developer',
                    startDate: 'Jan 2022',
                    endDate: 'Jan 2023',
                  ),
                ),
                SizedBox(width: Get.width*0.02,),
                Expanded(
                  child: _buildExperienceCard(
                    companyName: 'The Brainstormers',
                    location: 'Lahore, Pakistan',
                    jobType: 'Full-Time',
                    designation: 'Flutter Developer',
                    startDate: 'Jan 2023',
                    endDate: 'Present',
                  ),
                ),
                SizedBox(width: Get.width*0.1,),

              ],
            ),
            SizedBox(height: Get.height*0.04,),

            Row(
              children: [
                SizedBox(width: Get.width*0.1,),

                Expanded(
                  child: _buildExperienceCard(
                    companyName: 'The Brainstormers',
                    location: 'Lahore, Pakistan',
                    jobType: 'Full-Time',
                    designation: 'Flutter Developer',
                    startDate: 'Jan 2023',
                    endDate: 'Present',
                  ),
                ),
                Spacer(),
                SizedBox(width: Get.width*0.12,),

              ],
            ),
          ],
        ),
      );
  }





  Widget _buildExperienceCard({
    required String companyName,
    required String location,
    required String jobType,
    required String designation,
    required String startDate,
    required String endDate,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black.withOpacity(0.2))

      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  designation,
                  style: h2
                ),
                const SizedBox(height: 5),
                Text(
                  "$startDate to $endDate",
                  style: small
                ),
                const SizedBox(height: 10),

              ],
            ),
            SizedBox(width: Get.width*0.02,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  companyName,
                  style: h2
                ),
                const SizedBox(height: 5),
                Text(
                  location,
                  style: small
                ),
                const SizedBox(height: 10),

              ],
            ),
            SizedBox(width: Get.width*0.02,),

            Text(
              "Full Time",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
