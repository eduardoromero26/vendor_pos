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
              icon: const Icon(Icons.menu),
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
              backgroundImage: const NetworkImage(
                  'https://avatars.githubusercontent.com/u/1941417?v=4'),
              child: PopupMenuButton(
                itemBuilder: (_) => <PopupMenuItem<String>>[
                  const PopupMenuItem<String>(
                    value: 'profile',
                    child: Text('Profile'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'settings',
                    child: Text('Settings'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'logout',
                    child: Text('Logout'),
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
