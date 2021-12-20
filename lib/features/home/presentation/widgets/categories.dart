import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:teststore/common/app_icons.dart';
import 'package:teststore/components/shadow.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Category {
  String icon;
  String title;

  Category({required this.icon, required this.title});
}

class HomeCategories extends StatefulWidget {
  const HomeCategories({Key? key}) : super(key: key);

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  

  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    List<Category> categories = [
    Category(icon: AppIcons.phones, title: AppLocalizations.of(context)?.phones ?? ''),
    Category(icon: AppIcons.computer, title: AppLocalizations.of(context)?.computer ?? ''),
    Category(icon: AppIcons.heart, title: AppLocalizations.of(context)?.health ?? ''),
    Category(icon: AppIcons.books, title: AppLocalizations.of(context)?.books ?? ''),
    Category(icon: AppIcons.books, title: AppLocalizations.of(context)?.books ?? ''),
  ];
    Widget _categoryItem(int index, String icon, String title) {
      return Padding(
        padding: const EdgeInsets.only(right: 22),
        child: InkWell(
          onTap: () {
            setState(() {
              selectedCategory = index;
            });
          },
          child: Column(
            children: [
              ShadowContainer(
                child: SvgPicture.asset(
                  icon,
                  color: selectedCategory == index ? Colors.white : (index != 0 ? null : Colors.grey),
                ),
                color: selectedCategory == index
                    ? AppColors.orangeColor
                    : Colors.white,
                paddingValue: 22,
                isCircle: true,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: TextStyle(
                  color: selectedCategory == index
                      ? AppColors.orangeColor
                      : Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories.map(
            (category) {
              final index = categories.indexOf(category);
              return _categoryItem(
                index,
                categories[index].icon,
                categories[index].title,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
