import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/style/my_colors.dart';
import '../../../../theme/style/my_text_style.dart';
import '../widget/my_text_button.dart';

class WelcomePage extends StatefulWidget {
  int pageNumber;
  WelcomePage({super.key, this.pageNumber = 1});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;

    return Scaffold(
        body: Stack(
      children: [
        AnimatedPositioned(
          top: 0,
          left: 0,
          duration: Duration(
            seconds: 5,
          ),
          child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage(
                  'lib/features/welcome/presentation/images/image${widget.pageNumber}.png',
                ),
              ),
            ),

            //  Orange container
          ),
        ),
        AnimatedPositioned(
          duration: Duration(seconds: 5),
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
                  color: MyColors.orange.color,
                  borderRadius: BorderRadius.circular(45.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 32.h),
                    Text(
                      'We serve incomparable delicacies',
                      textAlign: TextAlign.center,
                      style: MyText.h4.textStyle.copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'All the best restaurants with their top home waiting for you, they cant’t wait for your order!!',
                      textAlign: TextAlign.center,
                      style:
                          MyText.body.textStyle.copyWith(color: Colors.white),
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
                                        : grey50,
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
                                arguments: {
                                  'pageNumber': widget.pageNumber - 1,
                                  'isNext': false,
                                },
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
                              // context.read<AppBloc>().add(AppWelcomed());
                              Navigator.pushReplacementNamed(
                                context,
                                '/auth/signin',
                              );
                            } else {
                              Navigator.pushReplacementNamed(
                                context,
                                '/welcome/welcome_page',
                                arguments: {
                                  'pageNumber': widget.pageNumber + 1,
                                  'isNext': true,
                                },
                              );
                            }
                          }),
                          textStyle: MyText.body.textStyle
                              .copyWith(color: Colors.white),
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
      ],
    ));
  }
}
