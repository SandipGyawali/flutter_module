import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Sandip Gyawali"),
            accountEmail: const Text("sandipgyawali10@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset("assets/profile.avif"),
              ),
            ),
            decoration: const BoxDecoration(
              color: Color(0xff7DCD9A),
            ),
          ),
          ListTile(
            leading: HugeIcon(
              icon: HugeIcons.strokeRoundedDownload04,
              color: Colors.grey.shade500,
              size: 24.0,
            ),
            title: const Text("Upload file"),
          ),
          ListTile(
            leading: HugeIcon(
              icon: HugeIcons.strokeRoundedUser,
              color: Colors.grey.shade500,
              size: 24.0,
            ),
            title: const Text("Profile"),
          ),
        ],
      ),
    );
  }
}
