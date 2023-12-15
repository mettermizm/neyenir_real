import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/core/components/cards/custom_card.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/core/components/texts/store_text.dart';

class StoreView extends StatelessWidget {
  const StoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: .035.sw, vertical: .0125.sw),
      child: CustomCard(
        image:
            'https://cdn1.ntv.com.tr/gorsel/LyBbdJvJuE2ULhdczuTgCQ.jpg?width=1000&mode=crop&scale=both',
        rating: 5,
        text: 'Mekan Puanı',
        children: [
          const CustomTextSemiBold('Nusret Steakhouse'),
          SizedBox(height: .01.sw),
          const StoreText(
            style: 'Steak',
            adress: 'Etiler Mahallesi, Nispetiye Cd No:87, 34337 Beşiktaş/İstanbul',
          ),
        ],
      ),
    );
  }
}
