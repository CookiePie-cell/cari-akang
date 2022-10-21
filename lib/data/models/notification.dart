class Notification {
  final String title, subtitle;
  final String date;

  const Notification(
      {required this.title, required this.subtitle, required this.date});
}

final notifications = [
  const Notification(
      title: 'INFO ORANG HILANG',
      subtitle: 'Bantu Alo Bin Ungke mencari kerabatnya yang hilang.',
      date: '17 Oktober 2022 10:30'),
  const Notification(
      title: 'INFO ORANG HILANG',
      subtitle: 'Bantu Utu Dodutu mencari kerabatnya yang hilang.',
      date: '12 Oktober 2022 14:24'),
  const Notification(
      title: 'INFO ORANG HILANG',
      subtitle: 'Bantu Sir Alex Ferguson mencari kerabatnya yang hilang.',
      date: '9 Oktober 2022 10:30'),
];

final messages = [
  const Notification(
      title: 'Christiano Ronaldo',
      subtitle: 'Selamat Pagi alsdnaksjdb asjd kjasdb asbd jabsjkd..',
      date: '17 Oktober 2022 10:30'),
  const Notification(
      title: 'Lionel Messi',
      subtitle: 'Saya ketemu Mbappe di jalan pak',
      date: '12 Oktober 2022 14:24'),
];
