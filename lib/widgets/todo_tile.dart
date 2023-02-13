import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      required this.name,
      required this.isComplated,
      required this.onChange,
      required this.onEdit,
      required this.onDelete});
  final String name;
  final bool isComplated;
  final Function(bool? value) onChange;
  final Function() onEdit;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Checkbox(
            value: isComplated,
            onChanged: onChange,
          ),
          GestureDetector(
            onTap: () {
              onChange;
            },
            onDoubleTap: onEdit,
            child: SizedBox(
              width: 220,
              child: Text(
                name,
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 18,
                  fontWeight:
                      (isComplated ? FontWeight.bold : FontWeight.normal),
                  decoration: (isComplated
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: onEdit,
            icon: const Icon(Icons.edit_outlined),
            color: HexColor("F9DA00"),
          ),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(
              Icons.delete_outline,
            ),
            color: HexColor("E64C3B"),
          ),
        ],
      ),
    );
  }
}
