// rpg.dart


import 'dart:io';
import 'rpg.dart';

// Função principal do jogo
void main() {
  final player = createPlayer();
  final monsters = createMonsters();

  print('Qual será seu nome?');
  print('Bem-vindo ao RPG em Dart!');
  print('Você é ${player.name} e está prestes a enfrentar monstros.');

  while (player.isAlive && monsters.isNotEmpty) {
    print('\nEscolha um monstro para atacar:');
    for (int i = 0; i < monsters.length; i++) {
      print('${i + 1}. ${monsters[i].name} (Vida: ${monsters[i].health})');
    }

    final choice = int.parse(stdin.readLineSync()!);
    if (choice < 1 || choice > monsters.length) {
      print('Escolha inválida!');
      continue;
    }

    final monster = monsters[choice - 1];
    player.attack(monster);
    
    if (monster.isAlive) {
      monster.attack(player);
    } else {
      print('${monster.name} foi derrotado!');
      monsters.removeAt(choice - 1);
    }

    if (!player.isAlive) {
      print('Você foi derrotado! Fim do jogo.');
      return;
    }
  }

  if (player.isAlive) {
    print('Parabéns! Você derrotou todos os monstros!');
  }
}
