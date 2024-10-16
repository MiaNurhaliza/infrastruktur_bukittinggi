import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final Function(String) onSelect;
  final String selectedItem;

  const Sidebar({Key? key, required this.onSelect, required this.selectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    './lib/assets/images/logo.png',
                    height: 130,
                    width: 200,
                  ),
                ],
              ),
            ),
            _buildListTile(
              context,
              icon: Icons.home,
              title: 'Home',
              route: '/home',
              selected: selectedItem == '/home',
            ),
            _buildListTile(
              context,
              icon: Icons.account_balance,
              title: 'Infrastruktur',
              route: '/InfraMain',
              selected: selectedItem == '/InfraMain',
            ),
            _buildListTile(
              context,
              icon: Icons.extension,
              title: 'Features',
              route: '/features',
              selected: selectedItem == '/features',
            ),
            _buildListTile(
              context,
              icon: Icons.article,
              title: 'Blog',
              route: '/blog',
              selected: selectedItem == '/blog',
            ),
            _buildListTile(
              context,
              icon: Icons.login,
              title: 'Login',
              route: '/login',
              selected: selectedItem == '/login',
            ),
            _buildListTile(
              context,
              icon: Icons.badge_rounded,
              title: 'Register',
              route: '/register',
              selected: selectedItem == '/register',
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context,
      {required IconData icon,
      required String title,
      required String route,
      required bool selected}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: selected
            ? const Color.fromARGB(218, 224, 218, 250)
            : Colors.transparent,
        border: selected
            ? Border.all(
                color: const Color.fromARGB(255, 255, 255, 255), width: 2)
            : null,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        selected: selected,
        onTap: () {
          Navigator.pop(context);
          onSelect(route);
        },
      ),
    );
  }
}
