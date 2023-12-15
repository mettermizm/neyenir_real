import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/core/components/button/suggest_me_button.dart';
import 'package:neyenir_app/src/core/components/circular_progress_indicator/ny_loading.dart';
import 'package:neyenir_app/src/presentation/view/post_view.dart';

class SuggestView extends StatefulWidget {
  const SuggestView({Key? key}) : super(key: key);

  @override
  State<SuggestView> createState() => _SuggestViewState();
}

class _SuggestViewState extends State<SuggestView> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () => setState(() => _loading = false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ÖNER')),
      body: _loading
          ? const NYLoading()
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: .035.sw),
                    child: const PostView(),
                  ),
                  SizedBox(height: .075.sw),
                  const SuggestMeButton(),
                  SizedBox(height: .075.sw),
                ],
              ),
            ),
    );
  }
}
