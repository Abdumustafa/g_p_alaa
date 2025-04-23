
import 'package:flutter/material.dart';

class NotificationsIconAppBare extends StatelessWidget {
  const NotificationsIconAppBare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Icon(
            Icons.notifications,
            color: Color(0xff006bff),
          ),
          CircleAvatar(
            radius: 5,
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
            child: CircleAvatar(
              radius: 3,
              backgroundColor: Colors.red,
              foregroundColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
