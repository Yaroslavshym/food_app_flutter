import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app_flutter/features/welcome/presentation/widget/my_text_button.dart';
import 'package:food_app_flutter/theme/my_colors.dart';

import '../../../../theme/my_text_style.dart';

class WelcomePage extends StatefulWidget {
  final int pageNumber;
  const WelcomePage({this.pageNumber = 1});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage(
                'lib/features/welcome/presentation/images/image${widget.pageNumber}.png'),
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              // right: size.width * 0.1,
              // left: size.width * 0.1,
              top: size.height * 0.45,
            ),
            child: Container(
              width: 311.w,
              height: 400.h,
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              decoration: BoxDecoration(
                color: MyColors.orange,
                borderRadius: BorderRadius.circular(45.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 32.h),
                  Text(
                    'We serve incomparable delicacies',
                    textAlign: TextAlign.center,
                    style: MyText.h4.textStyle,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'All the best restaurants with their top menu waiting for you, they cant’t wait for your order!!',
                    textAlign: TextAlign.center,
                    style: MyText.body.textStyle,
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) {
                        return index % 2 != 0
                            ? SizedBox(width: 4.w)
                            : Container(
                                width: 24.w,
                                height: 5.h,
                                decoration: BoxDecoration(
                                  color: widget.pageNumber ==
                                          ({
                                            1: 1,
                                            3: 2,
                                            5: 3,
                                          }[index + 1])
                                      ? Colors.white
                                      : MyColors.grey,
                                  borderRadius: BorderRadius.circular(100.r),
                                ),
                              );
                      },
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyTextButton(
                        text: 'Previous',
                        onTap: () => setState(() {
                          if (widget.pageNumber != 1) {
                            Navigator.pushReplacementNamed(
                              context,
                              '/welcome/welcome_page',
                              arguments: {'pageNumber': widget.pageNumber - 1},
                            );
                          }
                        }),
                        textStyle: MyText.body.textStyle.copyWith(
                          color: widget.pageNumber == 1
                              ? Colors.transparent
                              : Colors.white,
                        ),
                      ),
                      MyTextButton(
                        text: 'Next',
                        onTap: () => setState(() {
                          if (widget.pageNumber == 3) {
                            // TODO: change path
                            Navigator.pushReplacementNamed(
                              context,
                              '/welcome/welcome_page',
                              arguments: {'pageNumber': 1},
                            );
                          } else {
                            Navigator.pushReplacementNamed(
                              context,
                              '/welcome/welcome_page',
                              arguments: {'pageNumber': widget.pageNumber + 1},
                            );
                          }
                        }),
                        textStyle: MyText.body.textStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
