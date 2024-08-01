import 'package:flutter/material.dart';
import 'package:flutter_m/provider/auth_provider.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final key_;
  const AppBarWidget({
    required this.key_,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.black87,
        ),
        onPressed: () {
          print("-------> This is clicked open drawer");
          key_.currentState!.openDrawer();
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: InkWell(
            onTap: () {
              print("------>>>> Sign out button triggered");
              authProvider.signOut(context);
            },
            child: const HugeIcon(
              icon: HugeIcons.strokeRoundedLogoutSquare02,
              color: Colors.black,
              size: 24.0,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
