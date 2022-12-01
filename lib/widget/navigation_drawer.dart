import 'package:automa/views/product.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          color: Color.fromRGBO(35, 35, 35, 1),
          child: ListView(
            // padding: padding,
            children: [
              builHeaders(urlImage: ''),
              buildMenuItem(
                  text: 'Prodotti',
                  icon: Icons.badge,
                  onClicked: () => selectedItem(context, 0)),
            ],
          )),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white70;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  Widget builHeaders({
    required String urlImage,
  }) {
    return InkWell(
      child: Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.all(48),
        // padding: padding.add(EdgeInsets.symmetric(vertical: 50)),
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductPage(),
        ));

        break;
    }
  }
}
