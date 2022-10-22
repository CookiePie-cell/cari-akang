class Notification {
  final String id, title, subtitle;
  final String date;

  const Notification(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.date});
}

final notifications = [
  const Notification(
      id: '1',
      title: 'INFO ORANG HILANG',
      subtitle: 'Bantu Alo Bin Ungke mencari kerabatnya yang hilang.',
      date: '17 Oktober 2022 10:30'),
  const Notification(
      id: '2',
      title: 'INFO ORANG HILANG',
      subtitle: 'Bantu Utu Dodutu mencari kerabatnya yang hilang.',
      date: '12 Oktober 2022 14:24'),
  const Notification(
      id: '3',
      title: 'INFO ORANG HILANG',
      subtitle: 'Bantu Sir Alex Ferguson mencari kerabatnya yang hilang.',
      date: '9 Oktober 2022 10:30'),
];

final messages = [
  const Notification(
      id: '1',
      title: 'Christiano Ronaldo',
      subtitle: 'Selamat Pagi alsdnaksjdb asjd kjasdb asbd jabsjkd..',
      date: '17 Oktober 2022 10:30'),
  const Notification(
      id: '2',
      title: 'Lionel Messi',
      subtitle: 'Saya ketemu Mbappe di jalan pak',
      date: '12 Oktober 2022 14:24'),
];
