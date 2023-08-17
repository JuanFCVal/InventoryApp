import 'package:flutter/material.dart';

class ModalOptionItem extends StatelessWidget {
  final String text;
  final IconData icon;
  Function? onClick = () {};
  ModalOptionItem({
    super.key,
    required this.text,
    required this.icon,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick != null ? () => onClick!() : () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        decoration: const BoxDecoration(color: Colors.white),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 36,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(text)
            ],
          ),
        ),
      ),
    );
  }
}
