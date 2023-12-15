import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';

class CommentArea extends StatelessWidget {
  const CommentArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextLight(
      '50’li yaşlarının başında vefat eden Mahmut Usta vaktinde Erzurum’dan İstanbul’a yerleşmiş. Meşhur Hünkar Lokantası’nda aşçılık yaptıktan sonra Kıztaşı’ndaki bu mütevazı esnaf lokantasını açmış. İlk başlarda kavurma, pilav ve paça çorbası servis edilirken zamanla menüye birçok yemek eklenmiş. Tabii, en özel yemekleri kuzudan yapılan paça çorbası. Terbiyesinde koyu kıvamlı manda yoğurdu, tereyağı ve un kullanılıyor. Sakatat sevmeyenleri bile kendisine hayran bırakacak düzeyde. Beğenilen yemeklerden',
      fontSize: 11.sp,
      maxLinex: 3,
      overflow: true,
    );
  }
}
