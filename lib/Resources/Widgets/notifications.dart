import 'package:flutter/material.dart';
import 'package:nikeyboots/Resources/Animations/slide_animation.dart';
import 'package:nikeyboots/Resources/constants.dart';

class Notifications extends StatefulWidget {
  final int index;
  final String img;
  const Notifications({
    super.key,
    required this.size,
    required this.img,
    required this.index,
  });

  final BoxConstraints size;

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications>
    with SingleTickerProviderStateMixin {
  late SlideTransitionController slideTransition;
  @override
  void initState() {
    slideTransition =
        SlideTransitionController(this, KCONSTANTDURATION, const Offset(-1, 0));
    slideTransition.controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: widget.size.maxHeight * .12,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: widget.size.maxHeight * .12,
                  height: widget.size.maxHeight * .15,
                  decoration: BoxDecoration(
                      color: KCONSTANTWHITECOLOR,
                      borderRadius: BorderRadius.circular(20)),
                  child: FittedBox(
                    child: SlideTransition(
                        position: slideTransition.animation,
                        child: Image.asset(widget.img)),
                  ),
                ),
                SizedBox(
                  width: widget.size.maxWidth * .03,
                ),
                FittedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'We Have naw',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Products With Offers',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: widget.size.maxWidth * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '\$500',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: widget.size.maxWidth * .02,
                          ),
                          const Text(
                            '\$900',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                widget.index / 2 == 0
                    ? const Text('6min ago')
                    : const Text('20mins ago'),
                SizedBox(
                  height: widget.size.maxHeight * .02,
                ),
                const CircleAvatar(
                  backgroundColor: KCONTANTBLUECOLOR,
                  radius: 5,
                )
              ],
            ),
          ],
        ));
  }
}
