import 'package:flutter/material.dart';
import 'package:khata_app/theme_data/change_notifire.dart';
import 'package:provider/provider.dart';

class DrawerMaterial extends StatelessWidget {
  const DrawerMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    final obj = Provider.of<ChangeNotifireData>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(child: Text("Change theme")),
          Switch(
            value: obj.isDarkMode,
            onChanged: (value) {
              obj.updateTheme(value);
              print("change");
            },
          ),
        ],
      ),
    );
  }
}
