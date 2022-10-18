import 'package:cari_akang/utils/helper.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem(
      {required this.title,
      required this.subtitle,
      required this.date,
      super.key});

  final String title, subtitle, date;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(4.0),
        horizontalTitleGap: 10,
        minLeadingWidth: 10,
        isThreeLine: true,
        leading: const CircleAvatar(
          radius: 30,
          backgroundImage:
              AssetImage('assets/images/Komik-One-Piece-small.png'),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Helper.getAdaptiveText(context, 13.0)),
            ),
            Text(
              date,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: Helper.getAdaptiveText(context, 10.0)),
            ),
          ],
        ),
        subtitle: Text(
          subtitle,
          // overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
