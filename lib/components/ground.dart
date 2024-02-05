import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';

import '../game/assets.dart';
import '../game/tiger_game.dart';

class Ground extends SpriteComponent with HasGameRef<TigerGame> {
  Ground();
  @override
  Future<void> onLoad() async {
    final ground = await Flame.images.load(Assets.ground);

    position.y = gameRef.size.y - 100;
    size = gameRef.size;
    sprite = Sprite(ground);
  }
}
