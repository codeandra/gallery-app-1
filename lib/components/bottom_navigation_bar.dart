import 'package:flutter/material.dart';
import 'package:gallery_app/view/home_screen.dart';
import 'package:gallery_app/view/favorite_screen.dart';
import 'package:gallery_app/view/profile_screen.dart';

class BottomNavigationBarComponent extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigationBarComponent({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        Widget destinationScreen;
        if (index == 0) {
          destinationScreen = HomeScreen();
        } else if (index == 1) {
          destinationScreen = FavoriteScreen();
        } else {
          destinationScreen = ProfileScreen();
        }
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => destinationScreen,
            transitionDuration: Duration.zero,
          ),
        );
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box),
          label: 'Account',
        ),
      ],
    );
  }
}
