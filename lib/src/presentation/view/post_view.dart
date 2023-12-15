import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/core/components/shadow/custom_shadow.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/presentation/widget/post/comment_area.dart';
import 'package:neyenir_app/src/presentation/widget/post/image_area.dart';
import 'package:neyenir_app/src/presentation/widget/post/place_area.dart';
import 'package:neyenir_app/src/presentation/widget/post/rate_area.dart';
import 'package:neyenir_app/src/presentation/widget/post/social_area.dart';
import 'package:neyenir_app/src/presentation/widget/post/user_area.dart';

class PostView extends StatefulWidget {
  const PostView({Key? key, this.ownPost = false}) : super(key: key);

  final bool ownPost;

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(.0125.sw),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.0.r)),
        boxShadow: [CustomShadow()],
      ),
      child: Column(
        children: [
          /// A conditional widget. It is used to show the user area if the post is not own post.
          if (!widget.ownPost) const UserArea(),

          /// A column that contains the place, image, name, rate and comment of the post.
          Padding(
            padding: EdgeInsets.symmetric(horizontal: .04.sw, vertical: .0125.sw),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                PostDividerHalf(),

                /// A widget that is used to show the place of the post.
                PlaceArea(),
                PostDivider(),

                /// A widget that is used to show the image of the post.
                ImageArea(),
                PostDivider(),

                /// A widget that is used to show the place of the post.
                CustomTextSemiBold('Turmeric'),
                PostDivider(),

                /// A widget that is used to show the rate of the post.
                RateArea(),
                PostDivider(),

                /// A widget that is used to show the comment of the post.
                CommentArea(),
              ],
            ),
          ),

          /// A widget that is used to show the social area of the post.
          const SocialArea(),
        ],
      ),
    );
  }
}

class PostDivider extends StatelessWidget {
  const PostDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(height: .025.sw);
}

class PostDividerHalf extends StatelessWidget {
  const PostDividerHalf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(height: .0125.sw);
}
