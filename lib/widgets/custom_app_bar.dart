import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

PreferredSizeWidget customAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Center(
      child: Container(
        padding: const EdgeInsets.only(bottom: 2),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: HexColor("F9DA00"), width: 2),
          ),
          color: Colors.white,
        ),
        child: const Text(
          "SHOPPING LIST",
          style: TextStyle(
            fontFamily: 'RobotoSerif',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
    actions: [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert,
          ))
    ],
  );
}
