import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neyenir_app/src/core/components/button/secondary_button.dart';
import 'package:neyenir_app/src/core/components/padding/page_padding.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/core/constants/svg_constants.dart';

class ShareRateView extends StatefulWidget {
  const ShareRateView({Key? key}) : super(key: key);

  @override
  State<ShareRateView> createState() => _ShareRateViewState();
}

class _ShareRateViewState extends State<ShareRateView> {
  bool horizontalView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                horizontalView = !horizontalView;
              });
            },
            icon: const Icon(Icons.list),
          ),
        ],
      ),
      body: PagePadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    horizontalView
                        ? Image.network(
                            'http://www.haketsteakhouse.net/wp-content/uploads/2021/02/dallas-600-650-gr.jpg')
                        : Image.network(
                            'https://images.pexels.com/photos/580612/pexels-photo-580612.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          ),
                    SizedBox(
                      height: .2.sw,
                      width: 1.sw,
                      child: const DecoratedBox(
                        position: DecorationPosition.background,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              Colors.black54,
                              Colors.transparent,
                            ],
                            stops: [.4, 1.0],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0.0325.sw,
                      top: 0.0325.sw,
                      child: SvgPicture.asset(
                        SVGConstants.neyenir,
                        color: Colors.white,
                        height: 20,
                      ),
                    ),
                    Positioned(
                      right: 0.0325.sw,
                      top: 0.0325.sw,
                      child: Column(
                        children: [
                          CustomTextBold(
                            'Puanım',
                            color: Colors.white,
                            fontSize: 10.sp,
                          ),
                          CustomTextBold(
                            '4.2',
                            color: Colors.orange,
                            fontSize: 20.sp,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: SizedBox(
                        height: .4.sw,
                        width: 1.sw,
                        child: const DecoratedBox(
                          position: DecorationPosition.background,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black54,
                              ],
                              stops: [.1, 1.0],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0.0325.sw,
                      bottom: 0.0325.sw,
                      child: SizedBox(
                        height: horizontalView ? .35.sw : .65.sw,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                'Nusr-Et Steakhouse',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              AutoSizeText(
                                'DALLAS STEAK',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(child: SecondaryButton(title: 'POST PAYLAŞ', onPressed: () {})),
            )
          ],
        ),
      ),
    );
  }
}
