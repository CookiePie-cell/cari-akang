// import 'package:cari_akang/presentation/widgets/missing_card.dart';
// import 'package:cari_akang/utils/helper.dart';
// import 'package:flutter/material.dart';

// import '../../data/models/orang_hilang.dart';

// class BookmarkScreen extends StatefulWidget {
//   const BookmarkScreen({Key? key}) : super(key: key);

//   @override
//   State<BookmarkScreen> createState() => _BookmarkScreenState();
// }

// class _BookmarkScreenState extends State<BookmarkScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Size size = MediaQuery.of(context).size;
//     return Scaffold(
//         backgroundColor: Colors.greenAccent[700],
//         body: Column(
//           children: [
//             Padding(
//               padding:
//                   const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'CariAkang',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: Helper.getAdaptiveText(context, 34.0),
//                         fontWeight: FontWeight.bold),
//                   ),
//                   IconButton(
//                     icon: const Icon(
//                       Icons.notifications_none_rounded,
//                     ),
//                     iconSize: 35,
//                     color: Colors.white,
//                     onPressed: () {
//                       widget.isAuthenticated
//                           ? Navigator.pushNamed(context, '/notifications',
//                               arguments: widget.isAuthenticated)
//                           : showDialog<String>(
//                               context: context,
//                               builder: (context) => const MasukAlert());
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 width: double.infinity,
//                 margin: const EdgeInsets.only(top: 15.0),
//                 decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(50.0),
//                       topRight: Radius.circular(50.0),
//                     )),
//                 child: Column(
//                   // crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(
//                       height: 18.0,
//                     ),
//                     Center(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                         child: Text(
//                           'Bookmark',
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: Helper.getAdaptiveText(context, 28.0),
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 18.0,
//                     ),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: missings.length - 2,
//                         itemBuilder: (context, index) {
//                           return MissingCard(
//                               id: missings[index].id,
//                               nama: missings[index].nama,
//                               namaPelapor: missings[index].namaPelapor,
//                               umur: missings[index].umur!,
//                               jenisKelamin: missings[index].jenisKelamin,
//                               onTap: () =>
//                                   Navigator.pushNamed(context, '/details'),
//                               imgURL: missings[index].imgUrl,
//                               tanggalPosting: missings[index].tanggalPosting);
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ));
//   }
// }
