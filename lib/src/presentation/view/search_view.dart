import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/core/components/fields/default_text_form_field.dart';
import 'package:neyenir_app/src/core/components/search/search_delegate.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';

class SearchView extends AbstractPlatformSearchDelegate {
  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.trim().isNotEmpty) {
      // ! REMOVE AFTER DATA
      return Column(
        children: [
          if (query.trim().length > 1) ...[
            const ListTile(
              title: CustomTextSemiBold('Mekan', color: AppColor.light),
              tileColor: AppColor.dark,
            ),
            ListTile(
              dense: true,
              title: CustomTextMedium(query),
              contentPadding: EdgeInsets.symmetric(horizontal: .075.sw),
            ),
          ],
          if (query.trim().isNotEmpty && query.trim().length != 2) ...[
            const ListTile(
              title: CustomTextSemiBold('Kişi', color: AppColor.light),
              tileColor: AppColor.dark,
            ),
            const Divider(height: 0),
            ListTile(
              dense: true,
              title: CustomTextMedium(query),
              contentPadding: EdgeInsets.symmetric(horizontal: .075.sw),
            ),
            const Divider(height: 0),
            ListTile(
              dense: true,
              title: CustomTextMedium(query),
              contentPadding: EdgeInsets.symmetric(horizontal: .075.sw),
            ),
            const Divider(height: 0),
            ListTile(
              dense: true,
              title: CustomTextMedium(query),
              contentPadding: EdgeInsets.symmetric(horizontal: .075.sw),
            ),
            const Divider(height: 0),
          ],
          if (query.trim().isNotEmpty && query.trim().length != 3) ...[
            const ListTile(
              title: CustomTextSemiBold('Yemek', color: AppColor.light),
              tileColor: AppColor.dark,
            ),
            ListTile(
              dense: true,
              title: CustomTextMedium(query),
              contentPadding: EdgeInsets.symmetric(horizontal: .075.sw),
            ),
            const Divider(height: 0),
            ListTile(
              dense: true,
              title: CustomTextMedium(query),
              contentPadding: EdgeInsets.symmetric(horizontal: .075.sw),
            ),
            const Divider(height: 0),
          ],
        ],
      );
    } else {
      return const Center(child: CustomTextMedium('Please start typing the address'));
    }
  }

  @override
  Widget buildScaffold(Widget? body, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + .05.sw,
        elevation: 0,
        title: DefaultTextFormField(
          title: 'Yemek, mekan veya kişi ara...',
          controller: queryTextController,
          validator: null,
          autoFocus: true,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              query = "";
            },
          )
        ],
      ),
      body: _animatedSwitcher(body),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  AnimatedSwitcher _animatedSwitcher(Widget? body) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: body,
    );
  }
}
