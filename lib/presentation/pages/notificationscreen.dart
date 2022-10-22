import 'package:cari_akang/data/models/arguments.dart';
import 'package:cari_akang/data/models/notification.dart';
import 'package:cari_akang/data/models/orang_hilang_detail.dart';
import 'package:cari_akang/presentation/widgets/notification_item.dart';
import 'package:cari_akang/utils/helper.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({required this.isAuthenticated, Key? key})
      : super(key: key);

  final bool isAuthenticated;
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notifikasi',
              style: TextStyle(
                  fontSize: Helper.getAdaptiveText(context, 25.0),
                  color: Colors.white,
                  shadows: const [
                    Shadow(
                        blurRadius: 6.0,
                        color: Colors.black45,
                        offset: Offset(0.0, 0.0))
                  ])),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Color.fromARGB(166, 255, 255, 255),
            indicatorColor: Color.fromARGB(255, 227, 255, 242),
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.notifications_none,
                  // color: Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.message_outlined,
                  // color: Colors.white,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.greenAccent[700],
        ),
        body: TabBarView(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) => NotificationItem(
                    id: notifications[index].id,
                    title: notifications[index].title,
                    subtitle: notifications[index].subtitle,
                    date: notifications[index].date,
                    isMessage: false,
                    onTap: () => Navigator.pushNamed(context, '/details',
                        arguments: ScreenArguments(
                            isAuthenticated: widget.isAuthenticated,
                            detailLaporan: orangHilangDetail
                                .where((data) =>
                                    data.id == notifications[index].id)
                                .toList()[0])),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: notifications.length - 1,
                  itemBuilder: (context, index) => NotificationItem(
                    id: messages[index].id,
                    title: messages[index].title,
                    subtitle: messages[index].subtitle,
                    date: messages[index].date,
                    isMessage: true,
                    onTap: () => Navigator.pushNamed(context, '/chat'),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
