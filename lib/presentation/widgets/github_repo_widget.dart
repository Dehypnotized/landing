import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GithubRepoWidget extends StatelessWidget {
  final String gitUrl;
  final String title;
  final List<String> description;
  final Widget? titleIcon;

  const GithubRepoWidget({super.key, required this.gitUrl, required this.title, required this.description, this.titleIcon});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Expanded(
        child: Center(child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Padding(
                padding: screenWidth > 700 ? const EdgeInsets.all(40):  const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if(titleIcon!=null)
                      titleIcon!,
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    25.heightBox,
                    ElevatedButton(
                        onPressed: () => launchUrlString(gitUrl),
                        child: const Text(
                          'View on Github',
                        )),
                    25.heightBox,
                    for (var i = 0; i < description.length; i++)
                      Text(
                        description[i],
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                  ],
                )))));
  }
}
