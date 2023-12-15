import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/main.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/config/router/app_router.dart';

import 'package:neyenir_app/src/core/components/button/secondary_button.dart';
import 'package:neyenir_app/src/core/components/padding/page_padding.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';

class FilterView extends StatefulWidget {
  const FilterView({Key? key}) : super(key: key);

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> with SingleTickerProviderStateMixin {
  double km = 1;

  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  final sehir = List<SelectableLabels>.generate(
    8,
    (i) => i == 0 ? const SelectableLabels('Tüm Şehir') : SelectableLabels('$i'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filtrele')),
      body: SingleChildScrollView(
        child: PagePadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SelectableLabels(km.toStringAsFixed(0), selected: true),
                  Expanded(
                    child: Slider(
                      min: 1,
                      max: 25,
                      value: km,
                      divisions: 25,
                      activeColor: AppColor.primary,
                      inactiveColor: AppColor.primary.shade100,
                      semanticFormatterCallback: (double newValue) {
                        return '${newValue.toStringAsFixed(0)} alan içerisinde';
                      },
                      onChanged: (value) {
                        setState(() {
                          km = value;
                        });
                      },
                    ),
                  ),
                  CustomTextLight(
                    'alan içerisinde',
                    fontSize: 12.sp,
                  ),
                ],
              ),
              SizedBox(height: .025.sh),
              const CustomTextMedium('Sadece seçili şehirlerdeki sonuçları göster'),
              SizedBox(height: .025.sh),
              Wrap(spacing: 2.5, runSpacing: 5, children: sehir),
              SizedBox(height: .025.sh),
              Center(
                child: SecondaryButton(
                  title: 'Filtreyi Uygula',
                  onPressed: () {
                    router.removeLast();
                    router.push(const FeedRouter());
                  },
                ),
              ),
              SizedBox(height: .025.sh),
              const Divider(),
              SizedBox(height: .025.sh),
              const CustomTextSemiBold('Gıda Türü'),
              SizedBox(height: .025.sh),
              Container(
                constraints: BoxConstraints(maxHeight: 100, maxWidth: 1.sw),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey, width: 0.25),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                  unselectedLabelColor: AppColor.primary,
                  labelColor: Colors.white,
                  indicator: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  tabs: const [Tab(text: 'YİYECEKLER'), Tab(text: 'İÇECEKLER')],
                ),
              ),
              SizedBox(height: .025.sh),
              const CustomTextSemiBold('Sadece seçili kategorilerideki sonuçları göster'),
              SizedBox(height: .025.sh),
              Container(
                constraints: BoxConstraints(maxHeight: 150, maxWidth: 1.sw),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Wrap(spacing: 2.5, runSpacing: 5, children: sehir),
                    Wrap(spacing: 2.5, runSpacing: 5, children: sehir)
                  ],
                ),
              ),
              SizedBox(height: .025.sh),
              const CustomTextSemiBold('Sadece seçili şehirlerdeki sonuçları göster'),
              SizedBox(height: .025.sh),
              Wrap(
                spacing: 2.5,
                runSpacing: 5,
                children: sehir,
              ),
              SizedBox(height: .025.sh),
              Align(
                alignment: Alignment.bottomRight,
                child: SecondaryButton(
                  title: 'Filtreyi Uygula',
                  onPressed: () {
                    router.removeLast();
                    router.push(const FeedRouter());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectableLabels extends StatefulWidget {
  const SelectableLabels(
    this.text, {
    Key? key,
    this.selected = false,
  }) : super(key: key);

  final String text;
  final bool selected;

  @override
  State<SelectableLabels> createState() => _SelectableLabelsState();
}

class _SelectableLabelsState extends State<SelectableLabels> {
  bool _selected = false;

  @override
  void initState() {
    super.initState();
    _selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: _selected ? null : () => setState(() => _selected = !_selected),
      style: OutlinedButton.styleFrom(
        primary: _selected ? AppColor.primary : Colors.white,
        backgroundColor: _selected ? AppColor.primary : Colors.white,
        side: BorderSide(width: 0.5, color: _selected ? AppColor.primary : Colors.white),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      child: CustomTextMedium(
        '${widget.text} km',
        color: _selected ? AppColor.light : AppColor.primary,
        fontSize: 12.sp,
      ),
    );
  }
}
