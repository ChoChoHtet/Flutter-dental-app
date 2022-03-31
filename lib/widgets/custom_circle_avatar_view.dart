import 'package:flutter/material.dart';

import '../resources/dimens.dart';

class CustomCircleAvatarView extends StatelessWidget {
  const CustomCircleAvatarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: avatarSize,
      width: avatarSize,
      child: CircleAvatar(
        backgroundImage: NetworkImage(
            "https://i.pinimg.com/474x/eb/8d/d1/eb8dd17d4eb8aea6f054f9dcec443bf2.jpg"),
      ),
    );
  }
}