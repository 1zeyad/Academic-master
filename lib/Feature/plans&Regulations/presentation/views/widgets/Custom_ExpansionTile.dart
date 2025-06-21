import 'package:acdemy/core/utiles/app_color.dart';
import 'package:flutter/material.dart';

Widget CustomExpansionTile({required IconData icon, required String title, required List<Widget> children}) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ExpansionTile(                
        iconColor: Colors.red,
        collapsedIconColor: TColor.lightPrimaryColor3,
        dense: true,
        textColor: Colors.red,
        leading: Icon(icon, color: TColor.lightPrimaryColor3),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        children: children,
      ),
    );
  }

// Widget CustomExpansionTile_GpaRanges({required IconData icon, required String title, required children}) {
//     return Card(
//       elevation: 1,
//       margin: const EdgeInsets.symmetric(vertical: 6),
//       child: ExpansionTile(                
//         iconColor: Colors.red,
//         collapsedIconColor: TColor.lightPrimaryColor3,
//         dense: true,
//         textColor: Colors.red,
//         leading: Icon(icon, color: TColor.lightPrimaryColor3),
//         title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//         children:children
//       ),
//     );
//   }



