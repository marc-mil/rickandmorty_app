import 'package:flutter/material.dart';

class ShoppingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShoppingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:
        IconButton(
          icon: const Icon(Icons.menu),
          //onPressed: () => Navigator.of(context).pushNamed('/account'),
          onPressed: () => Scaffold.of(context).openDrawer(),
          color: Colors.white,
        ),
      title: TextButton(
        onPressed: () => Navigator.of(context).pushNamed('/'),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        ),
        child: const Text(
          'Versandhaus Walz',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      backgroundColor: const Color(0xFF14188C),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => Navigator.of(context).pushNamed('/search'),
          color: Colors.white,
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => Navigator.of(context).pushNamed('/cart'),
          color: Colors.white,
        ),
        IconButton(
          icon: const Icon(Icons.favorite),
          onPressed: () => Navigator.of(context).pushNamed('/wishlist'),
          color: Colors.white,
        ),
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () => Navigator.of(context).pushNamed('/profile'),
          color: Colors.white,
        ),

      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
