import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  String title = '';
  String image = '';
  Function? onClick = () {};
  ServiceItem({
    super.key,
    required this.title,
    required this.image,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: onClick != null ? () => onClick!() : () {},
        child: Column(
          children: [
            CircleAvatar(
              maxRadius: 35,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                image,
              ),
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
