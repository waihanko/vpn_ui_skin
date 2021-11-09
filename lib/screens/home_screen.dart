import 'package:flutter/material.dart';
import 'package:vpn_ui_skin/resources/colors.dart';
import 'package:vpn_ui_skin/widgets/section_view_banner.dart';
import 'package:vpn_ui_skin/widgets/vpn_connect_button/animated_swipe.dart';
import 'package:vpn_ui_skin/widgets/widget_get_premiun.dart';
import 'package:vpn_ui_skin/widgets/widget_network_speed.dart';
import 'package:vpn_ui_skin/widgets/widget_notification_alert.dart';
import 'package:vpn_ui_skin/widgets/widget_selected_vpn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AAA VPN"),
        leading: const Icon(Icons.settings),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.person_add),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children:  [
              const SectionViewBanner(),
              const SizedBox(height: 24,),
              const NetworkSpeedWidget(),
              const SizedBox(height: 24,),
              Flexible(
                child: Center(
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: SizedBox(
                      width: 180,
                      child: AnimatedSwipeToConfirm(
                        onConfirm: () {
                          setState(() {});
                        },
                        onCancel: () {
                          setState(
                                () {},
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24,),
              const SelectedVPNWidget(),
              const Align(alignment: Alignment.bottomCenter, child: WidgetGetPremium()),
            ],
          ),
        ],
      ),
    );
  }
}

