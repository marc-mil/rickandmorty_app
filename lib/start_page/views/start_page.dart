import 'package:flutter/material.dart';
import '../../widgets/app_bar.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ShoppingAppBar(),
      body:
            Text('Some cool stuff about Versandhaus Walz')
      );
  }
}