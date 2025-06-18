import 'package:acdemy/core/utiles/Text_style.dart';
import 'package:acdemy/core/utiles/app_color.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final dynamic value;

  const ProfileItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      child: Row(
        children: [
          Icon(icon, color: TColor.primaryColor), 
          const SizedBox(width: 10),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label, style: TTextstyle.bold15), 
                Text(
                  overflow: TextOverflow.ellipsis,
                  value.toString(), style: TextStyle(color: Colors.grey[700])), 
                
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}





// final IconData icon;
//   final String label;
//   final String value;

//   ProfileItem({required this.icon, required this.label, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.black54),
//       title: Text(label, style:TTextstyle.bold13),
//       subtitle: Text(value, style: TextStyle(fontSize: 16)),
//     );
//   }