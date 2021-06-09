import 'package:flutter/material.dart';
import 'package:socialapp/modal/FollowButton.dart';
import 'package:socialapp/modal/user.dart';

class PanelHeaderWidget extends StatefulWidget {
  final User user;
  final VoidCallback onClickedFollowing;

  const PanelHeaderWidget({
    @required this.user,
    @required this.onClickedFollowing,
    Key key,
  }) : super(key: key);

  @override
  _PanelHeaderWidgetState createState() => _PanelHeaderWidgetState();
}

class _PanelHeaderWidgetState extends State<PanelHeaderWidget> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          top: 15,
        ),
        child: Row(
          children: [
            Expanded(
              child: buildUser(),
            ),
            FollowButton(
              isFollowing: widget.user.isFollowing,
              onClicked: widget.onClickedFollowing,
            ),
          ],
        ),
      );
  buildUser() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.user.name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          widget.user.location,
        ),
      ],
    );
  }
}
