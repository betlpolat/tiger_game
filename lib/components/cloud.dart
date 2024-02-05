import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import '../game/assets.dart';
import '../game/config.dart';
import '../game/tiger_game.dart';

class Cloud extends SpriteComponent with HasGameRef<TigerGame> {
  Cloud({required this.positionX});

  final double positionX;
  @override
  Future<void> onLoad() async {
    final cloud = await Flame.images.load(Assets.cloud);
    size = Vector2(Config.cloudHeight, Config.cloudHeight);
    position.x = positionX;
    sprite = Sprite(cloud);
  }
}
