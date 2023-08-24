import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/app_bar.dart';
import 'package:shopping_app/drawer/views/drawer.dart';
import 'package:shopping_app/widgets/web_component.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});
  @override
  Widget build(BuildContext context) {
    final character = ModalRoute.of(context)!.settings.arguments as Map;
    //'${character['name']}',
    return Scaffold(
      drawer: const ShoppingDrawer(),
      appBar: const ShoppingAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children:[
              IconButton(
                alignment: Alignment.topLeft,
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pushNamed('/'),
                color: Colors.black,
              ),
              Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      character['name'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ))
            ]
          ),

          Image(
              image: NetworkImage(character['image'].toString()),
          ),
          Text('Status: ' + character['status']),
          Text('Gender: ' + character['gender']),
          Text('Species: ' + character['species']),
          Text('Last seen: ' + character['location']['name']),
          Spacer(),
          ShoppingCheckout(),
          OutlinedButton(
            onPressed: () {},
            child: Text("do sth"),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(130, 40)),
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}