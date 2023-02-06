import 'package:flutter/material.dart';
class LoadingView extends StatefulWidget {
  const LoadingView({Key? key}) : super(key: key);
  @override
  State<LoadingView> createState() => _LoadingViewState();
}
class _LoadingViewState extends State<LoadingView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}