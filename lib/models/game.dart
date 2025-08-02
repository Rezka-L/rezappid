class Game {
  final String id;
  final String name;
  final String image;

  Game({required this.id, required this.name, required this.image});
}

final List<Game> games = [
  Game(id: 'mlbb', name: 'Mobile Legends', image: 'assets/images/mlbb.png'),
  Game(id: 'ff', name: 'Free Fire', image: 'assets/images/ff.png'),
  Game(id: 'pubgm', name: 'PUBG Mobile', image: 'assets/images/pubgm.png'),
];