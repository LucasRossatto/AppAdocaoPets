import 'package:flutter/material.dart';

class SwitchBtn extends StatefulWidget {
  const SwitchBtn({super.key});

  @override
  State<SwitchBtn> createState() => _SwitchBtnState();
}

class _SwitchBtnState extends State<SwitchBtn> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      trackColor: WidgetStateProperty.resolveWith<Color?>(
        (states) => states.contains(WidgetState.selected) ? const Color(0xFF5250E1) : null,
      ),
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (states) => states.contains(WidgetState.selected)
            ? const Color(0xFF5250E1).withOpacity(0.54)
            : states.contains(WidgetState.disabled)
                ? Colors.grey.shade400
                : null,
      ),
      thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
        (states) => states.contains(WidgetState.selected)
            ? const Icon(Icons.check)
            : const Icon(Icons.close),
      ),
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
        });
      },
    );
  }
}
