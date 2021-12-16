import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:teststore/features/cart/domain/entities/basket_entity.dart';
import 'package:teststore/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:teststore/features/cart/presentation/pages/cart_bloc_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int index;
  final Function(int index) changeScreen;

  const CustomBottomNavBar({
    Key? key,
    required this.index,
    required this.changeScreen,
  }) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35), topRight: Radius.circular(35)),
      child: BottomAppBar(
        color: AppColors.blueColor,
        child: SizedBox(
          height: 56,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextIconBottomBar(
                  icon: Icons.home,
                  selected: widget.index == 0,
                  onPressed: () {
                    widget.changeScreen(0);
                  },
                ),
                IconBottomBar(
                  icon: 'lib/assets/icons/Bag.svg',
                  selected: widget.index == 1,
                  onPressed: () {
                    widget.changeScreen(1);
                  },
                  currentIndex: 1,
                ),
                IconBottomBar(
                  icon: 'lib/assets/icons/JustHeart.svg',
                  selected: widget.index == 2,
                  onPressed: () {
                    widget.changeScreen(2);
                  },
                  currentIndex: 2,
                ),
                IconBottomBar(
                  icon: 'lib/assets/icons/Person.svg',
                  selected: widget.index == 3,
                  onPressed: () {
                    widget.changeScreen(3);
                  },
                  currentIndex: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar({
    Key? key,
    required this.icon,
    required this.selected,
    required this.onPressed,
    required this.currentIndex,
  }) : super(key: key);
  final String icon;
  final bool selected;
  final Function() onPressed;
  final int currentIndex;

  final accentColor = const Color(0xffffffff);

  String getItemsCount(List<BasketEntity> items) {
    int count = 0;
    for (var item in items) {
      count += item.count;
    }
    return count.toString();
  }

  @override
  Widget build(BuildContext context) {
    Widget cartButton(String itemCount) {
      if (itemCount != '') {
        return Stack(
          children: [
            InkWell(
              onTap: onPressed,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  icon,
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: const BoxConstraints(
                  minWidth: 12,
                  minHeight: 12,
                ),
                child: Text(
                  itemCount,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        );
      } else {
        return InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SvgPicture.asset(
              icon,
            ),
          ),
        );
      }
    }

    Widget cartButtonWithStates() {
      return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state is CartLoadedState) {
          return cartButton(state.itemCount);
        }
        if (state is CartLoadingState) {
          return cartButton(state.itemCount);
        }
        return Container();
      });
    }

    if (currentIndex == 1) {
      return cartButtonWithStates();
    }
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SvgPicture.asset(
          icon,
        ),
      ),
    );
  }
}

class TextIconBottomBar extends StatelessWidget {
  const TextIconBottomBar({
    Key? key,
    required this.icon,
    required this.selected,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final primaryColor = const Color(0xff4338CA);
  final accentColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.circle,
              size: 9,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Explorer',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
