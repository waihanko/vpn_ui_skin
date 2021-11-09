import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vpn_ui_skin/resources/colors.dart';

class NetworkSpeedWidget extends StatefulWidget {
  const NetworkSpeedWidget({Key? key}) : super(key: key);

  @override
  _NetworkSpeedWidgetState createState() => _NetworkSpeedWidgetState();
}

class _NetworkSpeedWidgetState extends State<NetworkSpeedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: NetworkSpeedItem(
              isDownloadSpeed: true,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
          Container(
            width: 1,
            height: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 24),
            color: premiumCardBgColor,
          ),
          const Expanded(
            flex: 1,
            child: NetworkSpeedItem(
              isDownloadSpeed: false,
              crossAxisAlignment: CrossAxisAlignment.end,
            ),
          ),
        ],
      ),
    );
  }
}

class NetworkSpeedItem extends StatelessWidget {
  final bool isDownloadSpeed;
  final CrossAxisAlignment crossAxisAlignment;

  const NetworkSpeedItem(
      {this.isDownloadSpeed = false,
      this.crossAxisAlignment = CrossAxisAlignment.start});

  String get titleText => isDownloadSpeed ? "Download Speed" : "Upload Speed";

  WidgetSpan get networkStatus => WidgetSpan(
        child: RotatedBox(
          quarterTurns: isDownloadSpeed ? -1 : 1,
          child: Icon(
            Icons.arrow_right_alt,
            size: 18,
            color: isDownloadSpeed ? Colors.green : Colors.red,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                  text: titleText,
                  style: const TextStyle(
                    color: hintTextColor,
                    fontSize: 12,
                  )),
              networkStatus,
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          "60 kb/s",
          style: TextStyle(
            color: titleTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
