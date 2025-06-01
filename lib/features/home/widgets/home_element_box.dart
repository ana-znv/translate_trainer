import 'package:flutter/material.dart';

class HomeElementBox extends StatelessWidget {
  const HomeElementBox({
    super.key,
    required this.screenRoute,
    required this.text,
  });

  final String screenRoute;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    WidgetStateProperty<Color> buttonBackgroundColor = WidgetStateProperty.all(
      Color.fromARGB(255, 134, 110, 254),
    );
    return SizedBox(
      height: 50,
      width: 280,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, screenRoute);
        },
        style: ButtonStyle(backgroundColor: buttonBackgroundColor),
        child: Text(text, style: theme.textTheme.bodyMedium),
      ),
    );
  }
}
