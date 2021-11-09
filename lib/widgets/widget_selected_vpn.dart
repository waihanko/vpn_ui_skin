import 'package:flutter/material.dart';
import 'package:vpn_ui_skin/resources/colors.dart';

class SelectedVPNWidget extends StatefulWidget {
  const SelectedVPNWidget({Key? key}) : super(key: key);

  @override
  _SelectedVPNWidgetState createState() => _SelectedVPNWidgetState();
}

class _SelectedVPNWidgetState extends State<SelectedVPNWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        leading: const Icon(Icons.circle),
        title:const Text("United King"),
        trailing:const Icon(Icons.arrow_right),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            side: BorderSide(width: 1, color: premiumCardBgColor)),
        onTap: () {
          print('Card Clicked');
        },
      ),
    );
  }
}
