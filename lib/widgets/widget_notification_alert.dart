import 'package:flutter/material.dart';
import 'package:vpn_ui_skin/resources/colors.dart';

class NotificationAlertWidget extends StatelessWidget {
  const NotificationAlertWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: notificationCardBgColor,
      constraints: const BoxConstraints(
        minHeight: 60,
        minWidth: double.infinity,
        maxHeight: 400,
      ),
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Icon(
              Icons.circle_notifications,
              color: notificationIconColor,
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Lorem Ipsum Lorem Ipsum",
                style: TextStyle(
                    fontSize: 12.0, height: 1.5, color: titleTextColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
