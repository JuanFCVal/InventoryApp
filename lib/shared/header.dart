import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../UI/colors.dart';
import '../UI/textStyles.dart';
import '../providers/sessionProvider.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  const Header({super.key, required this.height, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final sessionProvider = Provider.of<SessionProvider>(context);

    return Container(
      height: height,
      decoration: BoxDecoration(color: ColorMap.primary),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Hero(
                tag: "profilePicture",
                child: CircleAvatar(
                  radius: 26,
                  backgroundImage:
                      NetworkImage(sessionProvider.currentUser.profilePicture),
                ),
              ),
              Expanded(
                child: Text(
                  textAlign: TextAlign.end,
                  "Matriz-Quito",
                  style: TextStyles.p(color: Colors.white),
                ),
              ),
              const Icon(
                Icons.location_on,
                color: Colors.red,
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          Text(
            title,
            style: TextStyles.h2Style(color: Colors.white),
          )
        ],
      ),
    );
  }
}
