import 'package:flutter/material.dart';
import 'package:neyenir_app/src/core/components/button/primary_button.dart';
import 'package:neyenir_app/src/core/components/button/secondary_button.dart';

class FollowButton extends StatefulWidget {
  const FollowButton({Key? key, required this.status, this.outline}) : super(key: key);

  final bool status;
  final bool? outline;

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  late bool _status;

  @override
  void initState() {
    super.initState();
    _status = widget.status;
  }

  void _toggleFollow() {
    _status = !_status;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _status
        ? PrimaryButton(onPressed: _toggleFollow, title: 'Takip Et')
        : SecondaryButton(
            onPressed: _toggleFollow,
            outline: widget.outline ?? true,
            icon: Icons.check_circle,
            title: 'Takiptesin',
          );
  }
}
