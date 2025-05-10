import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app_flutter/theme/style/my_text_style.dart';

import '../../../../theme/style/my_colors.dart';
import '../bloc/home_bloc.dart';
import '../widget/category_button.dart';

List<String> categoryNames = ['Home', 'Cart', 'Message', 'Profile'];
List<IconData> categoryIcons = [
  Icons.home,
  Icons.shopping_bag,
  Icons.message,
  Icons.person,
];

class HomePage extends StatelessWidget {
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
                  NavigationBar(
                    backgroundColor: Colors.transparent,
                    destinations: List.generate(
                      min(categoryIcons.length, categoryNames.length),
                      (i) {
                        return CategoryButton(
                          icon: categoryIcons.elementAt(i),
                          label: categoryNames.elementAt(i),
                        );
                      },
                    ),
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
            currentIndex: context.read<HomeBloc>().currentIndex,
            selectedItemColor: MyColors.orange.color,
            selectedLabelStyle: MyText.body.textStyle.copyWith(
              color: MyColors.orange.color,
              fontWeight: FontWeight.normal,
            ),
            backgroundColor: Colors.white10,
            onTap: (i) {
              context
                  .read<HomeBloc>()
                  .add(ChangeCurrentBottomNavBarIndex(newCurrentIndex: i));
            },
            items: List.generate(
              4,
              (i) {
                return BottomNavigationBarItem(
                  label: categoryNames.elementAt(i),
                  // TODO:  change color

                  activeIcon: Icon(
                    categoryIcons.elementAt(i),
                    color: MyColors.orange.color,
                  ),
                  icon: Icon(
                    categoryIcons.elementAt(i),
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
