import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app_flutter/theme/style/my_text_style.dart';

import '../../../../theme/style/my_colors.dart';
import '../bloc/home_bloc.dart';
import '../widget/category_button.dart';

List<String> pageNames = ['Home', 'Cart', 'Message', 'Profile'];
List<IconData> pageIcons = [
  Icons.home,
  Icons.shopping_bag,
  Icons.message,
  Icons.person,
];

List<String> categoryNames = ['Burger', 'Drink', 'Pizza', 'Taco'];
List<String> categoryIconUrls = [
  'https://iili.io/3vs9NkP.png', // https://freeimage.host/i/3vs9NkP burger
  'https://iili.io/3vLElx2.png', // https://freeimage.host/i/3vLElx2 drink
  'https://iili.io/3vLV1iN.png', // https://freeimage.host/i/3vLV1iN pizza
  'https://iili.io/3vLWvTJ.png', // https://freeimage.host/i/3vLWvTJ taco
];
List<Widget> categoryIcons = [];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            expandedHeight: 229.h,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                children: [
                  Text(
                    '',
                    style: MyText.body.textStyle.copyWith(color: Colors.black),
                  )
                ],
              ),
              background: Image.asset(
                'lib/features/home/presentation/images/app_bar_image.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  //   title+see all
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Find by Category',
                        textAlign: TextAlign.end,
                        style: MyText.body.textStyle.copyWith(
                          fontSize: 16.sp,
                          color: MyColors.black100.color,
                        ),
                      ),
                      GestureDetector(
                        // TODO: on tap
                        child: Text(
                          'See All',
                          textAlign: TextAlign.end,
                          style: MyText.body.textStyle.copyWith(
                            color: MyColors.orange.color,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //   categories
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 65.h,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: List.generate(
                            min(pageIcons.length, categoryNames.length),
                            (i) {
                              return Row(
                                children: [
                                  SizedBox(
                                    width: i != 0 ? 30.w : 0,
                                  ),
                                  CategoryButton(
                                    buttonWidth: 59.w,
                                    onTap: () => context.read<HomeBloc>().add(
                                          ChangeCurrentCategoryIndex(
                                            currentCategoryIndex: i,
                                          ),
                                        ),
                                    isActive: context
                                            .read<HomeBloc>()
                                            .currentCategoryIndex ==
                                        i,
                                    imageUrl: categoryIconUrls.elementAt(i),
                                    label: categoryNames.elementAt(i),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),

                  //   products
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return BottomNavigationBar(
            enableFeedback: false,
            showUnselectedLabels: false,
            currentIndex: context.read<HomeBloc>().currentPageIndex,
            selectedItemColor: MyColors.orange.color,
            selectedLabelStyle: MyText.body.textStyle.copyWith(
              color: MyColors.orange.color,
              fontWeight: FontWeight.normal,
            ),
            backgroundColor: Colors.white10,
            onTap: (i) {
              context
                  .read<HomeBloc>()
                  .add(ChangeCurrentPageIndex(newCurrentPageIndex: i));
            },
            items: List.generate(
              4,
              (i) {
                return BottomNavigationBarItem(
                  label: pageNames.elementAt(i),
                  // TODO:  change color

                  activeIcon: Icon(
                    pageIcons.elementAt(i),
                    color: MyColors.orange.color,
                  ),
                  icon: Icon(
                    pageIcons.elementAt(i),
                    color: MyColors.grey50.color,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
