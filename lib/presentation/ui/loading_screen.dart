import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key? key,
    this.transparent,
    this.bgOpacity,
  }) : super(key: key);
  final bool? transparent;
  final double? bgOpacity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (transparent == null || transparent == true)
          ? Colors.transparent
          : Theme.of(context)
              .scaffoldBackgroundColor
              .withOpacity(bgOpacity ?? 1),
      body: Center(
        child: SizedBox(
          height: 90,
          width: 90,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
