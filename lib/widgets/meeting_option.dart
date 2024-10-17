import 'package:flutter/material.dart';
import 'package:zoom_clone_101/utils/colors.dart';

class MeetingOption extends StatelessWidget {
  const MeetingOption(
      {super.key, required this.text, required this.isMute, this.onChanged});
  final String text;
  final bool isMute;
  final Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Switch.adaptive(
            value: isMute,
            onChanged: onChanged,
            activeColor: Colors.green,
            inactiveTrackColor: Colors.black,
            activeTrackColor: Colors.black,
            inactiveThumbColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
