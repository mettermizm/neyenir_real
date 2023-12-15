import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/core/enums/profile_enums.dart';
import 'package:neyenir_app/src/presentation/view/post_view.dart';
import 'package:neyenir_app/src/presentation/widget/post/rating_bar.dart';
import 'package:neyenir_app/src/presentation/widget/profile/profile_header/profile_detail_widget.dart';
import 'package:neyenir_app/src/presentation/widget/profile/profile_header/profile_header.dart';
import 'package:neyenir_app/src/presentation/widget/profile/profile_header/profile_info_widget.dart';
import 'package:neyenir_app/src/presentation/widget/profile/profile_header/profile_status_widget.dart';

class StoreFoodView extends StatelessWidget {
  const StoreFoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 310.h,
              child: Stack(
                children: [
                  Positioned(
                    top: 130.h,
                    child: Container(
                      height: 180.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
                        image: DecorationImage(
                          colorFilter:
                              ColorFilter.mode(Colors.black.withOpacity(0.25), BlendMode.darken),
                          image: const NetworkImage(
                            'http://www.haketsteakhouse.net/wp-content/uploads/2021/02/dallas-600-650-gr.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 230.h,
                    child: CustomTextBlack(
                      'DALLAS STEAK',
                      color: Colors.white,
                      fontSize: 18.sp,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: .05.sw),
                    child: const ProfileHeader(
                      shadow: false,
                      details: ProfileDetailWidget(profileEnums: ProfileEnums.store),
                      info: ProfileInfoWidget(profileEnums: ProfileEnums.store),
                      status: ProfileStatusWidget(profileEnums: ProfileEnums.store),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: .1.sw,
                vertical: .05.sw,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: const [
                        RatingBar(title: 'Lezzet', score: 4),
                        RatingBar(title: 'Isı', score: 4),
                        RatingBar(title: 'Posiyon Büyüklüğü', score: 4),
                        RatingBar(title: 'Servis', score: 3),
                        RatingBar(title: 'Sunum', score: 5),
                        RatingBar(title: 'Fiyat', score: 5),
                        RatingBar(title: 'Mekan Müşteri Kitlesi', score: 1),
                      ],
                    ),
                  ),
                  SizedBox(width: 0.05.sw),
                  SizedBox(
                    width: 0.2.sw,
                    child: Column(
                      children: [
                        CustomTextBold('4.5', fontSize: 23.sp),
                        CustomTextMedium('Ürün Puanı', fontSize: 8.sp),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: .04.sw),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) => const PostView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
