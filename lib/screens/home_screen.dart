import 'package:chat_app/pages/calls_page.dart';
import 'package:chat_app/pages/contacts_page.dart';
import 'package:chat_app/pages/messages_page.dart';
import 'package:chat_app/pages/notifications_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: (i) {
          setState(() {
            index = i;
          });
        },
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({
    required this.onItemSelected,
  });

  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _NavigationBarItem(
              index: 0,
              label: 'Messages',
              icon: CupertinoIcons.bubble_left_bubble_right_fill,
              onTap: onItemSelected,
            ),
            _NavigationBarItem(
              index: 1,
              label: 'Notifications',
              icon: CupertinoIcons.bell_solid,
              onTap: onItemSelected,
            ),
            _NavigationBarItem(
              index: 2,
              label: 'Calls',
              icon: CupertinoIcons.phone_fill,
              onTap: onItemSelected,
            ),
            _NavigationBarItem(
              index: 3,
              label: 'Contacts',
              icon: CupertinoIcons.person_2_fill,
              onTap: onItemSelected,
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
