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
  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: (index) {
          pageIndex.value = index;
        },
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({
    required this.onItemSelected,
  });

  final ValueChanged<int> onItemSelected;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });

    widget.onItemSelected;
  }

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
              onTap: handleItemSelected,
            ),
            _NavigationBarItem(
              index: 1,
              label: 'Notifications',
              icon: CupertinoIcons.bell_solid,
              onTap: handleItemSelected,
            ),
            _NavigationBarItem(
              index: 2,
              label: 'Calls',
              icon: CupertinoIcons.phone_fill,
              onTap: handleItemSelected,
            ),
            _NavigationBarItem(
              index: 3,
              label: 'Contacts',
              icon: CupertinoIcons.person_2_fill,
              onTap: handleItemSelected,
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
      behavior: HitTestBehavior.opaque,
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
