import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/core/components/image/darken_image.dart';
import 'package:neyenir_app/src/core/components/padding/page_padding.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/presentation/view/filter_view.dart';

class PopularFoodsView extends StatefulWidget {
  const PopularFoodsView({Key? key}) : super(key: key);

  @override
  State<PopularFoodsView> createState() => _PopularFoodsViewState();
}

class _PopularFoodsViewState extends State<PopularFoodsView> {
  final sehir = List<SelectableLabels>.generate(5, (i) => const SelectableLabels('YEMEK'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PagePadding(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextSemiBold('Civardaki Popüler Lezzetler', fontSize: 14.sp),
              SizedBox(height: .05.sw),
              Wrap(spacing: 2.5, runSpacing: 5, children: sehir),
              SizedBox(height: .05.sw),
              SizedBox(
                height: .5.sh,
                child: GridView.builder(
                  itemCount: 4,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return const DarkenImage(
                      name: 'DALLAS STEAK',
                      url:
                          'http://www.haketsteakhouse.net/wp-content/uploads/2021/02/dallas-600-650-gr.jpg',
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
