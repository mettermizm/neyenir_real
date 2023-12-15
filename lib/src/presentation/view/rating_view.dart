import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/core/components/button/primary_button.dart';
import 'package:neyenir_app/src/core/components/button/secondary_button.dart';
import 'package:neyenir_app/src/core/components/fields/location_text_form_field.dart';
import 'package:neyenir_app/src/core/components/image/darken_image.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';

class RatingView extends StatefulWidget {
  const RatingView({Key? key}) : super(key: key);

  @override
  State<RatingView> createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {
  final PageController _pageController = PageController();
  double currentPage = 0;

  final rates =
      List<SelectableRates>.generate(5, (i) => SelectableRates(index: i + 1, selectedIndex: 1));

  final rateTexts = [
    'Kötü',
    'Vasat',
    'İdare Eder',
    'İyi',
    'Harika',
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 0.075.sw,
          vertical: 0.025.sw,
        ),
        child: Column(
          children: [
            CustomTextSemiBold(
              currentPage != 3
                  ? 'Bir kaç ufak adım sonrası puanlamayı tamamlayacağız.'
                  : 'Bu adım sonrasında değerlendirmen neyenir’de paylaşılacaktır.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 0.025.sh),
            RatingPagination(currentPage: currentPage),
            SizedBox(height: 0.025.sh),
            Flexible(
              flex: 4,
              child: PageView.builder(
                itemCount: 4,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const LocationTextFormField(),
                      GridView.builder(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ...rateTexts
                              .map(
                                (e) => Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 0.01.sw,
                                    vertical: 0.01.sw,
                                  ),
                                  width: 0.075.sw,
                                  child: CustomTextMedium(
                                    e,
                                    fontSize: 8.sp,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                              .toList()
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const CustomTextMedium(
                            'Porsiyon Boyutu',
                          ),
                          SizedBox(width: .025.sw),
                          ...rates,
                        ],
                      ),
                      currentPage < 2.5
                          ? PrimaryButton(
                              title: 'Sonraki Adıma Geçelim',
                              onPressed: () {
                                _pageController.animateToPage(
                                  currentPage.floor() + 1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                            )
                          : SecondaryButton(
                              title: 'Değerlendirmeyi Yayınla',
                              onPressed: () {},
                            )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingPagination extends StatelessWidget {
  const RatingPagination({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  final double currentPage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .10.sh,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PaginationLabels(
            page: 1,
            detail: 'LOKASYON',
            currentPage: currentPage.floor() + 1,
          ),
          PaginationLabels(
            page: 2,
            detail: 'ÜRÜN',
            currentPage: currentPage.floor() + 1,
          ),
          PaginationLabels(
            page: 3,
            detail: 'PUAN',
            currentPage: currentPage.floor() + 1,
          ),
          PaginationLabels(
            page: 4,
            detail: 'YORUM',
            currentPage: currentPage.floor() + 1,
          ),
        ],
      ),
    );
  }
}

class PaginationLabels extends StatelessWidget {
  const PaginationLabels({
    Key? key,
    required this.page,
    required this.detail,
    required this.currentPage,
  }) : super(key: key);

  final int page;
  final String detail;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomTextBold(
          '$page',
          fontSize: 20.sp,
          color: page == currentPage
              ? AppColor.primary
              : page < currentPage
                  ? AppColor.success
                  : AppColor.primary.shade100,
        ),
        CustomTextLight(
          detail,
          fontSize: 10.sp,
          color: page == currentPage
              ? AppColor.primary
              : page < currentPage
                  ? AppColor.success
                  : AppColor.primary.shade100,
        ),
        Container(
          width: .175.sw,
          height: 1.5,
          color: page == currentPage
              ? AppColor.primary
              : page < currentPage
                  ? AppColor.success
                  : AppColor.light,
        ),
      ],
    );
  }
}

class SelectableRates extends StatefulWidget {
  const SelectableRates({
    Key? key,
    required this.index,
    required this.selectedIndex,
  }) : super(key: key);

  final int index;
  final int selectedIndex;

  @override
  State<SelectableRates> createState() => _SelectableRatesState();
}

class _SelectableRatesState extends State<SelectableRates> {
  late int _index;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _index = widget.index;
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0.01.sw),
      width: 0.075.sw,
      height: 0.075.sw,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            _selectedIndex = -1;
            _selectedIndex = widget.index;
          });
        },
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: _index == _selectedIndex ? AppColor.primary : Colors.white,
          side: BorderSide(
            color: _index == _selectedIndex ? AppColor.primary : Colors.white,
            width: 0.5,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        child: CustomTextMedium(
          '${widget.index}',
          color: _index == _selectedIndex ? AppColor.light : AppColor.primary,
        ),
      ),
    );
  }
}
