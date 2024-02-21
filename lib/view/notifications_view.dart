import 'package:flutter/material.dart';
import 'package:nikeyboots/Resources/Widgets/notifications.dart';
import 'package:nikeyboots/Resources/constants.dart';

class NotificationsView extends StatefulWidget {
  final BoxConstraints size;
  const NotificationsView({Key? key, required this.size}) : super(key: key);

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: KCONSTANTPADDING,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    'Clear All',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: KCONTANTBLUECOLOR),
                  ),
                ],
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Notifications(
                    index: index,
                    size: widget.size,
                    img: 'Assets/images/Nikee/nikee_8.png',
                  );
                }),
            const Text(
              'Yesterday',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Notifications(
                    index: index,
                    size: widget.size,
                    img: 'Assets/images/Nikee/nikee_5.png',
                  );
                }),
          ],
        ),
      ),
    );
  }
}
