class Player {
  String name;
  int health;
  int attackPower;

  Player({required this.name, required this.health, required this.attackPower});

  bool get isAlive => health > 0;

  void attack(Monster monster) {
    print('$name ataca ${monster.name}!');
    monster.health -= attackPower;
    if (monster.health < 0) monster.health = 0;
    print('${monster.name} tem ${monster.health} de vida restante.');
  }
}

class Monster {
  String name;
  int health;
  int attackPower;

  Monster({required this.name, required this.health, required this.attackPower});

  bool get isAlive => health > 0;

  void attack(Player player) {
    print('$name ataca ${player.name}!');
    player.health -= attackPower;
    if (player.health < 0) player.health = 0;
    print('${player.name} tem ${player.health} de vida restante.');
  }
}

// Função para criar uma lista de monstros
List<Monster> createMonsters() {
  return [
    Monster(name: 'Goblin', health: 50, attackPower: 5),
    Monster(name: 'Orc', health: 80, attackPower: 8),
    Monster(name: 'Dragon', health: 150, attackPower: 15),
    Monster(name: 'Troll', health: 60, attackPower: 6),
    Monster(name: 'Lich', health: 120, attackPower: 12),
    Monster(name: 'Golem', health: 100, attackPower: 10)
  ];
}

// Função para criar o jogador
Player createPlayer() {
  return Player(name: 'Hero', health: 100, attackPower: 10);
}
