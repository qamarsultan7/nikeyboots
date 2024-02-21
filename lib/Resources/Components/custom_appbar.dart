import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nikeyboots/Resources/constants.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onpress;
  final String lefticon;
  final Widget rightIcon;
  final Widget title;
  const CustomAppbar({Key? key,required this.title, required this.onpress, required this.lefticon,required this.rightIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      surfaceTintColor: const Color.fromRGBO(0, 0, 0, 0),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onpress,
                child: FittedBox(
                  child: CircleAvatar(
                    
                    backgroundColor: KCONSTANTWHITECOLOR,
                    child: SvgPicture.asset(lefticon),
                  ),
                ),
              ),
              title,
               rightIcon,
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      actions: const [
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
