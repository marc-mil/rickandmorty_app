import 'package:flutter/material.dart';

class ShoppingDrawer extends StatelessWidget {
  const ShoppingDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Container(
          color: Colors.blue,
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Home'),
                textColor: Colors.white,
                trailing: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onTap: () {
                  print("tapped on container");
                },
              ),
              ListTile(
                title: Text('About'),
                textColor: Colors.white,
                trailing: Icon(
                  Icons.info_rounded,
                  color: Colors.white,
                ),
                onTap: () {
                  print("tapped on container");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
