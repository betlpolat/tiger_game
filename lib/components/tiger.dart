import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

import '../game/assets.dart';
import '../game/tiger_game.dart';

class Tiger extends SpriteComponent with HasGameRef<TigerGame>, CollisionCallbacks {
  Tiger();

  @override
  Future<void> onLoad() async {
    final tiger = await Flame.images.load(Assets.tigerJump);
    position
      ..y = gameRef.size.y - 180
      ..x = gameRef.size.x / 2;
    size = gameRef.size / 7;
    sprite = Sprite(tiger);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (position.y <= 472) {
      position.y += 200 * dt;
    }
  }

  @override
  onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    position.y += 100;
  }

  void jump() {
    add(
      MoveByEffect(
        Vector2(0, -350),
        EffectController(
          duration: 0.5,
          curve: Curves.decelerate,
        ),
        onComplete: () => {},
      ),
    );
  }

  void move({required bool isLeft}) {
    if (isLeft && position.x > -20) {
      position.x -= 2;
    } else if (position.x < game.size.x - 160) {
      position.x += 2;
    }
  }
}
