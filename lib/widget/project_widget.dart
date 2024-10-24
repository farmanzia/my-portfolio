import 'package:flutter/material.dart';
import 'package:flutter_web_practice/helper/util/appStyle.dart';

class ProjectWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onGithubTap;
  final VoidCallback onLiveDemoTap;

  const ProjectWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onGithubTap,
    required this.onLiveDemoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Image container
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:  32.0,vertical: 8),
                child: Container(
                  width: double.infinity,
                  height: 240,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/projectImg.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(child: Text('Image not available'));
                      },
                    ),
                  ),
                ),
              ),
              // Title
              Text(
                title,
                style:
                    h2
              ),
              const SizedBox(height: 8),
              // Buttons
              OutlinedButton(
                onPressed: () {},
                onHover: (isHover){
                },
                style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all( const Color(0xFF0866FC))     ,
                  side: MaterialStateProperty.all(
                    BorderSide(color: Colors.white), // Set border color
                  ),
                ),
                child:  Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    'app link',
                    style:  btnTxt.copyWith(color:  Colors.white) , // Set text color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
