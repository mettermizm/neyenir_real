import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/core/components/button/danger_button.dart';
import 'package:neyenir_app/src/core/components/button/primary_button.dart';
import 'package:neyenir_app/src/core/components/button/secondary_button.dart';
import 'package:neyenir_app/src/core/components/circle_avatar/default_circle_avatar.dart';
import 'package:neyenir_app/src/core/components/fields/default_text_form_field.dart';
import 'package:neyenir_app/src/core/components/padding/page_padding.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/core/enums/image_source.dart';

class PersonalInformationView extends StatefulWidget {
  const PersonalInformationView({Key? key}) : super(key: key);

  @override
  State<PersonalInformationView> createState() => _PersonalInformationViewState();
}

class _PersonalInformationViewState extends State<PersonalInformationView> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PROFILE')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: .1.sh,
            padding: CustomPadding.symmetric(),
            child: Row(
              children: [
                const DefaultCircleAvatar(
                  'assets/images/user.jpg',
                  source: ImageSource.asset,
                ),
                SizedBox(width: .035.sw),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextSemiBold('Profil Fotoğrafın'),
                    SizedBox(height: .005.sw),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        PrimaryButton(title: 'Değiştir', onPressed: () {}),
                        SizedBox(width: .05.sw),
                        DangerButton(title: 'Sil', onPressed: () {})
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.075.sw,
              vertical: 0.025.sw,
            ),
            child: const CustomTextSemiBold('Ad Soyad'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.075.sw,
              vertical: 0.025.sw,
            ),
            child: DefaultTextFormField(controller: null, validator: null, title: 'N***** B******'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
            child: Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.all(AppColor.success),
                  value: isChecked,
                  shape: const CircleBorder(),
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                const CustomTextLight('İsmim Profilimde Görünmesin')
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.075.sw,
              vertical: 0.025.sw,
            ),
            child: const CustomTextSemiBold('Kendinden Bahset'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.075.sw,
              vertical: 0.025.sw,
            ),
            child: DefaultTextFormField(
              controller: null,
              validator: null,
              title: 'Merhaba...',
              length: 200,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.075.sw,
              vertical: 0.025.sw,
            ),
            child: const CustomTextSemiBold('Ülke'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.075.sw,
              vertical: 0.025.sw,
            ),
            child: DefaultTextFormField(
              controller: null,
              validator: null,
              title: 'Türkiye',
              suffix: const Icon(
                Icons.arrow_drop_down,
                color: AppColor.primary,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.075.sw,
              vertical: 0.025.sw,
            ),
            child: const CustomTextSemiBold('E-Posta Adresi'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.075.sw,
              vertical: 0.025.sw,
            ),
            child: DefaultTextFormField(
              controller: null,
              validator: null,
              verified: true,
              title: 'alptugyaman@hotmail.com',
              suffix: TextButton(
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: .0125.sw),
                  child: Text(
                    'Değiştir',
                    style: TextStyle(
                      color: AppColor.primary,
                      decoration: TextDecoration.underline,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: SecondaryButton(title: 'Kaydet', onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
