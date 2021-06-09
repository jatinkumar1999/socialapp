import 'package:flutter/material.dart';
import 'package:socialapp/PanelHeaderWeidget.dart';
import 'package:socialapp/StatsWidget.dart';
import 'package:socialapp/modal/user.dart';

class PanelWidget extends StatelessWidget {
  final User user;
  final VoidCallback onClickedPanel;
  final VoidCallback onClickedFollowing;

  const PanelWidget({
    Key key,
    @required this.user,
    @required this.onClickedPanel,
    @required this.onClickedFollowing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatsWidget(user: user),
        Expanded(
          child: GestureDetector(
            onTap: onClickedPanel,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  PanelHeaderWidget(
                    user: user,
                    onClickedFollowing: onClickedFollowing,
                  ),
                  Expanded(
                    child: buildProfile(user),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  buildProfile(User user) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onClickedPanel,
      child: Container(
        padding: const EdgeInsets.all(25),
        child: buildProfileDetails(user),
      ),
    );
  }

  buildProfileDetails(User user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(user.bio),
        const SizedBox(height: 3),
        const Text("Photos",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            )),
        const SizedBox(height: 12),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: user.urlPhotos
                .map(
                  (url) => Container(
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.only(right: 5),
                    child: Image.asset(
                      url,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
