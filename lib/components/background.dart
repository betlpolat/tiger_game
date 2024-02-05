import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';

import '../game/assets.dart';
import '../game/tiger_game.dart';

class Background extends SpriteComponent with HasGameRef<TigerGame> {
  Background();

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.background);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}
