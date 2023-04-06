import 'package:flutter/material.dart';
import 'package:vendor_pos/widgets/atoms/search_bar/search_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.searchController,
    this.onMenuPressed,
  }) : super(key: key);

  final TextEditingController searchController;
  final VoidCallback? onMenuPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: onMenuPressed,
              icon: Icon(Icons.menu),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SearchBar(
                  controller: searchController,
                  hintText: 'Search destinations...',
                ),
              ),
            ),
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/1941417?v=4'),
              child: PopupMenuButton(
                itemBuilder: (_) => <PopupMenuItem<String>>[
                  PopupMenuItem<String>(
                    value: 'profile',
                    child: const Text('Profile'),
                  ),
                  PopupMenuItem<String>(
                    value: 'settings',
                    child: const Text('Settings'),
                  ),
                  PopupMenuItem<String>(
                    value: 'logout',
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
