import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';

import '../game/tiger_game.dart';
import 'cloud.dart';

class CloudGroup extends PositionComponent with HasGameRef<TigerGame> {
  CloudGroup();
  final random = Random();

  @override
  Future<void> onLoad() async {
    await addAll([
      Cloud(positionX: 50),
      Cloud(positionX: 100),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += 100 * dt;
    if (position.y > 300) {
      removeFromParent();
    }
  }
}
