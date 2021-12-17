import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:teststore/components/shadow.dart';
import 'package:teststore/features/home/presentation/widgets/search_input.dart';

class SearchAndQr extends StatelessWidget {
  SearchAndQr({ Key? key }) : super(key: key);

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width / 1.3,
            height: MediaQuery.of(context).size.width / 10,
            child: SearchInput(
                textController: textController, hintText: "Search")),
        SizedBox(
          height: MediaQuery.of(context).size.width / 10,
          width: MediaQuery.of(context).size.width / 10,
          child: ShadowContainer(
            child: SvgPicture.asset(
              'lib/assets/icons/QR.svg',
            ),
            isCircle: true,
            paddingValue: 10,
            color: AppColors.orangeColor,
          ),
        ),
      ],
    );
  }
}