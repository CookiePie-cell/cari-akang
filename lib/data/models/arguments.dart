import 'package:cari_akang/data/models/orang_hilang_detail.dart';

class ScreenArguments {
  final bool? isAuthenticated;

  final OrangHilangDetail? detailLaporan;

  ScreenArguments({this.isAuthenticated = false, this.detailLaporan});
}
