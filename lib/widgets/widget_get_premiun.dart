import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vpn_ui_skin/resources/colors.dart';

class WidgetGetPremium extends StatefulWidget {
  const WidgetGetPremium({Key? key}) : super(key: key);

  @override
  _WidgetGetPremiumState createState() => _WidgetGetPremiumState();
}

class _WidgetGetPremiumState extends State<WidgetGetPremium> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: premiumCardBgColor,
      constraints: const BoxConstraints(
        minHeight: 60,
        minWidth: double.infinity,
        maxHeight: 400,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            width: 12,
          ),
          SvgPicture.asset(
            "assets/icons/premium_diamond.svg",
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Get Premium",
                style: TextStyle(
                  fontSize: 14.0,
                  height: 1.5,
                  color: getPremiumTitleColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text("Unlock all premium features",
                  style: TextStyle(
                    color: hintTextColor,
                    fontSize: 12,
                  )),
            ],
          ),
          const Spacer(),
          MaterialButton(
            color: iconColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            onPressed: () {},
            child: const Text(
              "Subscribe",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 12,
          )
        ],
      ),
    );
  }
}
