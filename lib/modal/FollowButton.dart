import 'package:flutter/material.dart';

class FollowButton extends StatefulWidget {
  final bool isFollowing;

  final VoidCallback onClicked;
  const FollowButton({
    @required this.isFollowing,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClicked,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        height: 50,
        width: widget.isFollowing ? 50 : 120,
        child: widget.isFollowing ? buildFriendButton() : buildFollowButton(),
      ),
    );
  }

  buildFriendButton() => Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.orange,
        ),
        child: const Icon(
          Icons.people,
          color: Colors.white,
        ),
      );
  buildFollowButton() => Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.orange,
            width: 3,
          ),
        ),
        child: const Text(
          "Follow",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.orange,
            fontSize: 20,
          ),
        ),
      );
}
