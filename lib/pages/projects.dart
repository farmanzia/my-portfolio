import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_practice/helper/util/appStyle.dart';
import 'package:flutter_web_practice/widget/project_widget.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: Column(children: [
         Text(
          'Projects',
          style: h0,
        ),
        Text(
          'Browse my recent',
          style: small,
        ),
        // SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ProjectWidget(
                  imageUrl: 'https://via.placeholder.com/300', // Example image URL
                  title: 'My Awesome Project',
                  onGithubTap: () {
                    // Action for GitHub button
                    print('GitHub button tapped');
                  },
                  onLiveDemoTap: () {
                    // Action for Live Demo button
                    print('Live Demo button tapped');
                  },
                ),
              ),
              Expanded(
                child: ProjectWidget(
                  imageUrl: 'https://via.placeholder.com/300', // Example image URL
                  title: 'My Awesome Project',
                  onGithubTap: () {
                    // Action for GitHub button
                    print('GitHub button tapped');
                  },
                  onLiveDemoTap: () {
                    // Action for Live Demo button
                    print('Live Demo button tapped');
                  },
                ),
              ),
              Expanded(
                child: ProjectWidget(
                  imageUrl: 'https://via.placeholder.com/300', // Example image URL
                  title: 'My Awesome Project',
                  onGithubTap: () {
                    // Action for GitHub button
                    print('GitHub button tapped');
                  },
                  onLiveDemoTap: () {
                    // Action for Live Demo button
                    print('Live Demo button tapped');
                  },
                ),
              ),
              Expanded(
                child: ProjectWidget(
                  imageUrl: 'https://via.placeholder.com/300', // Example image URL
                  title: 'My Awesome Project',
                  onGithubTap: () {
                    // Action for GitHub button
                    print('GitHub button tapped');
                  },
                  onLiveDemoTap: () {
                    // Action for Live Demo button
                    print('Live Demo button tapped');
                  },
                ),
              ),

            ],
          ),
        ),
      ],),
    );
  }
}
