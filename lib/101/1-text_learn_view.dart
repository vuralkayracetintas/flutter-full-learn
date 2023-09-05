import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  const TextLearnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text((ProjectKeys.text1 * 10),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: ProjectStyles.firstStyle),
            Text(
              (ProjectKeys.text2 * 10),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: ProjectColors.welcomeColor),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectStyles {
  static TextStyle firstStyle = const TextStyle(
      wordSpacing: 2,
      letterSpacing: 2,
      fontSize: 16,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w600);
}

class ProjectColors {
  static Color welcomeColor = Colors.blueAccent;
}

class ProjectKeys {
  static const String text1 = "Buy the best one ";
  static const String text2 = "Hello";
}
