import 'package:flutter/material.dart';

class SwtichBtn extends StatefulWidget {
  const SwtichBtn({super.key});

  @override
  State<SwtichBtn> createState() => _SwtichBtnState();
}

class _SwtichBtnState extends State<SwtichBtn> {
  bool light0 = true;
  bool light1 = true;
  @override
  Widget build(BuildContext context) {
    final MaterialStateProperty<Color?> trackColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Color(0xFF5250E1);
        }
        return null;
      },
    );
    final MaterialStateProperty<Color?> overlayColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Color(0xFF5250E1).withOpacity(0.54);
        }
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey.shade400;
        }
        return null;
      },
    );

    MaterialStateProperty.resolveWith<Icon?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const Icon(Icons.check);
        }
        return const Icon(Icons.close);
      },
    );

    return Switch(
      trackColor: trackColor,
      overlayColor: overlayColor,
      value: light0,
      onChanged: (bool value) {
        setState(() {
          light0 = value;
        });
      },
    );
  }
}
