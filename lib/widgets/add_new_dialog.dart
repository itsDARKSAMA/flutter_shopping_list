import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AddNewDialog extends StatelessWidget {
  const AddNewDialog(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});
  final TextEditingController controller;
  final Function() onSave;
  final Function() onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextField(
            controller: controller,
            style: const TextStyle(fontFamily: 'Cario'),
            decoration: InputDecoration(
              hintText: "ITEM NAME",
              hintStyle: const TextStyle(fontFamily: 'Cairo'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: HexColor("ACD850"),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  onPressed: onSave,
                  child: const Text(
                    "ADD ITEM",
                    style: TextStyle(
                        fontFamily: 'RobotoSerif',
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: HexColor("ACD850"),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  onPressed: onCancel,
                  child: const Text(
                    "CANCEL",
                    style: TextStyle(
                        fontFamily: 'RobotoSerif',
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
