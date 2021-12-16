import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:teststore/components/shadow.dart';

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
  List<Category> categories = [
    Category(icon: 'lib/assets/icons/Phone.svg', title: 'Phones'),
    Category(icon: 'lib/assets/icons/Computer.svg', title: 'Computer'),
    Category(icon: 'lib/assets/icons/Heart.svg', title: 'Health'),
    Category(icon: 'lib/assets/icons/Books.svg', title: 'Books'),
    Category(icon: 'lib/assets/icons/Books.svg', title: 'Ipads'),
  ];

  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
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
