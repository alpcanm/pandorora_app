import 'package:flutter/material.dart';
import '../widget_consts.dart';

class NightModeSwitch extends StatefulWidget {
  const NightModeSwitch({Key? key}) : super(key: key);

  @override
  _NightModeSwitchState createState() => _NightModeSwitchState();
}

class _NightModeSwitchState extends State<NightModeSwitch> {
  bool _switchState = false;

  @override
  Widget build(BuildContext context) {
    return WC.paddingAll(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.mode_night,
                color: Theme.of(context).secondaryHeaderColor,
              ),
              const VerticalDivider(),
              Text(
                "Night mode",
                style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
              ),
            ],
          ),
          themeSwitch(),
        ],
      ),
    );
  }

  Widget themeSwitch() {
    return Switch(
        value: _switchState,
        onChanged: (value) {
          setState(() {
            _switchState = value;
          });
        });
  }
}
