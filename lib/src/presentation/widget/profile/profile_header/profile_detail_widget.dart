import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/core/components/texts/store_text.dart';
import 'package:neyenir_app/src/core/enums/profile_enums.dart';
import 'package:neyenir_app/src/presentation/widget/profile/profile_header/profile_detail_layout_widget.dart';

class ProfileDetailWidget extends StatefulWidget {
  const ProfileDetailWidget({Key? key, required this.profileEnums}) : super(key: key);

  final ProfileEnums profileEnums;

  @override
  State<ProfileDetailWidget> createState() => _ProfileDetailWidgetState();
}

class _ProfileDetailWidgetState extends State<ProfileDetailWidget> {
  late String image;
  String? name;
  String? title;
  String? bio;
  String? style;
  String? adress;
  String? degree;
  String? description;
  String? store;
  String? url;
  String? trailingTitle;
  double? rating;
  bool? verified;

  @override
  void initState() {
    super.initState();
    if (widget.profileEnums == ProfileEnums.me) {
      image = 'assets/images/user.jpg';
      name = 'Neslihan Bayraktar';
      bio = 'Yemek yazarı, stil ve yaşam rehberi, kedi sever.';
      url = 'twitter.com/neslitat';
    } else if (widget.profileEnums == ProfileEnums.user) {
      image = 'assets/images/avatar.png';
      name = 'Hüseyin Arslan';
      bio = 'Yemek yazarı, gurme.';
      url = 'twitter.com/huso';
    } else if (widget.profileEnums == ProfileEnums.store) {
      image = 'assets/images/taps_bebek.png';
      title = 'Taps Bebek';
      style = 'Steak';
      adress = ' - Etiler Mahallesi, Nispetiye Cd No:87, 34337 Beşiktaş/İstanbul';
      trailingTitle = 'Mekan Puanı';
      rating = 4.4;
      verified = true;
    } else if (widget.profileEnums == ProfileEnums.employee) {
      image = 'assets/images/employee.jpg';
      name = 'Mehmet Şengül';
      degree = 'Şef';
      store = 'Taps Bebek';
      url = 'mehmetsef.com';
      verified = true;
      trailingTitle = 'Personal Puanı';
      rating = 4.8;
      verified = true;
    }
  }

  List<Widget> userAndMeWidgets() {
    return [
      CustomTextSemiBold(name!, fontSize: 12.sp),
      SizedBox(height: 3.h),
      CustomTextMedium(bio!, fontSize: 8.sp),
      SizedBox(height: 7.h),
      CustomTextMedium(url!, fontSize: 8.sp, color: AppColor.secondary),
    ];
  }

  List<Widget> storeWidgets() {
    return [
      CustomTextSemiBold(title!, fontSize: 12.sp),
      SizedBox(height: 3.h),
      const StoreText(
        style: 'Steak',
        adress: 'Etiler Mahallesi, Nispetiye Cd No:87, 34337 Beşiktaş/İstanbul',
      ),
      SizedBox(height: 6.h),
      CustomTextMedium(
        verified! ? 'Doğrulanmış mekan' : 'Doğrulanmamış mekan',
        fontSize: 7.sp,
        color: verified! ? AppColor.secondary : AppColor.danger,
        decoration: TextDecoration.underline,
      ),
    ];
  }

  List<Widget> employeeWidgets() {
    return [
      Row(
        children: [
          CustomTextSemiBold(name!, fontSize: 12.sp),
          Icon(Icons.verified, color: AppColor.secondary, size: 12.sp)
        ],
      ),
      SizedBox(height: 5.h),
      CustomTextMedium(degree!, fontSize: 8.sp),
      SizedBox(height: 1.5.h),
      CustomTextSemiBold(store!, fontSize: 8.sp, decoration: TextDecoration.underline),
      SizedBox(height: 1.5.h),
      CustomTextMedium(url!, fontSize: 8.sp, color: AppColor.secondary),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ProfileDetailLayoutWidget(
      image: image,
      subText: widget.profileEnums == ProfileEnums.user || widget.profileEnums == ProfileEnums.me
          ? userAndMeWidgets()
          : widget.profileEnums == ProfileEnums.store
              ? storeWidgets()
              : employeeWidgets(),
      trailingTitle: trailingTitle,
      rating: rating,
    );
  }
}
