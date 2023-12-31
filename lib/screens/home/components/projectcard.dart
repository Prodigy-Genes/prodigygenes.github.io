// ignore_for_file: unused_element, deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:portfolio_site/models/project.dart';
import 'package:portfolio_site/responsive.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../../constants.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard ({super.key,
  required this.project});

  void _launchURL(String? url) async {
  try {
    if (url != null && await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  } catch (e) {
    print('Error launching URL: $e');
  }
}


  final Project project;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      color: secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const Spacer(),
          Text(
            project.description!,
            maxLines: Responsive.isMobileLarge(context) ? 3 : 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(height: 1.5),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              _launchURL(project.link);
            },
            child: const Text(
              "Read More >>",
              style: TextStyle(color: primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}