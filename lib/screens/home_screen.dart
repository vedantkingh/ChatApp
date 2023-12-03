import 'package:chat_app/pages/calls_page.dart';
import 'package:chat_app/pages/contacts_page.dart';
import 'package:chat_app/pages/messages_page.dart';
import 'package:chat_app/pages/notifications_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[2],
      bottomNavigationBar: _BottomNavigationBar(),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Container(
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _NavigationBarItem(
              index: 0,
              label: 'Messages',
              icon: CupertinoIcons.bubble_left_bubble_right_fill,
            ),
            _NavigationBarItem(
              index: 1,
              label: 'Notifications',
              icon: CupertinoIcons.bell_solid,
              onTap: (index) {
                print(index);
              },
            ),
            _NavigationBarItem(
              index: 2,
              label: 'Calls',
              icon: CupertinoIcons.phone_fill,
              onTap: () {},
            ),
            _NavigationBarItem(
              index: 3,
              label: 'Contacts',
              icon: CupertinoIcons.person_2_fill,
              onTap: (index) {
                print(index);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem(
      {required this.index,
      required this.label,
      required this.icon,
      required this.onTap});

  final int index;
  final String label;
  final IconData icon;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              label,
              style: TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
