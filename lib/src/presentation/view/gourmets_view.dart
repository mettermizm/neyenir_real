import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/presentation/view/follow_view.dart';

class GourmetsView extends StatefulWidget {
  const GourmetsView({Key? key}) : super(key: key);

  @override
  State<GourmetsView> createState() => _GourmetsViewState();
}

class _GourmetsViewState extends State<GourmetsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gurme'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: .0125.sw),
          child: const UserCard(),
        ),
      ),
    );
  }
}
