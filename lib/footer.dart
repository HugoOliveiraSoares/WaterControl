import 'package:flutter/material.dart';
import 'package:trabalhomobile/routes.dart';

class Footer {
  BottomNavigationBar build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: GestureDetector(
              child: Icon(
                Icons.home,
                color: Colors.blue,
                size: 30,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(Routes.HOME);
              },
            ),
            label: 'Principal'),
        BottomNavigationBarItem(
            icon: GestureDetector(
              child: Icon(
                IconData(62649, fontFamily: 'MaterialIcons'),
                color: Colors.blue,
                size: 30,
              ),
              onTap: () {},
            ),
            label: 'Dicas'),
        BottomNavigationBarItem(
            icon: GestureDetector(
              child: Icon(
                IconData(58447, fontFamily: 'MaterialIcons'),
                color: Colors.blue,
                size: 30,
              ),
              onTap: () {},
            ),
            label: 'Notificação'),
      ],
    );
  }
}
