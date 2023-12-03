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
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _NavigationBarItem(
              label: 'Messages',
              icon: CupertinoIcons.bubble_left_bubble_right_fill,
            ),
            _NavigationBarItem(
              label: 'Notifications',
              icon: CupertinoIcons.bell_solid,
            ),
            _NavigationBarItem(
              label: 'Calls',
              icon: CupertinoIcons.phone_fill,
            ),
            _NavigationBarItem(
              label: 'Contacts',
              icon: CupertinoIcons.person_2_fill,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
