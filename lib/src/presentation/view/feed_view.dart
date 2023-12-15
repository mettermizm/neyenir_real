import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/main.dart';
import 'package:neyenir_app/src/config/router/app_router.dart';
import 'package:neyenir_app/src/core/components/button/primary_button.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/presentation/view/post_view.dart';

class FeedView extends StatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feed')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0.025.sw),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextMedium('Takip Ettiğin Gurmeler', fontSize: 14.sp),
                    PrimaryButton(
                      title: "Filtrele",
                      icon: Icons.filter_list,
                      outline: true,
                      onPressed: () {
                        router.push(const FilterRouter());
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: .025.sw),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return const PostView();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
