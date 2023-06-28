import 'package:flutter/material.dart';

class timeOptionsList {
  static List<DropdownMenuItem<int>> timeOptions = [
    const DropdownMenuItem(value: 60, child: Text("1 min")),
    const DropdownMenuItem(value: 180, child: Text("3 min")),
    const DropdownMenuItem(value: 300, child: Text("5 min")),
    const DropdownMenuItem(value: 600, child: Text("10 min")),
    const DropdownMenuItem(value: 1800, child: Text("30 min")),
  ];
}
