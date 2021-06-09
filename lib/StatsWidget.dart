import 'package:flutter/material.dart';
import 'package:socialapp/modal/user.dart';

class StatsWidget extends StatelessWidget {
  final User user;

  const StatsWidget({@required this.user, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildStaticisWidget("Followers", user.countFollowers),
        buildStaticisWidget("Posts", user.countPosts),
        buildStaticisWidget("Following", user.countFollowing),
      ],
    );
  }

  buildStaticisWidget(String stats, int number) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            "$number",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            stats,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
