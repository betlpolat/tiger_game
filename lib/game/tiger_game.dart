import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/timer.dart';

import '../components/background.dart';
import '../components/cloud_group.dart';
import '../components/ground.dart';
import '../components/tiger.dart';
import 'config.dart';

class TigerGame extends FlameGame with TapDetector, MouseMovementDetector, HasCollisionDetection {
  TigerGame();
  late Tiger tiger;
  Timer interval = Timer(Config.cloudTimer, repeat: true);
  @override
  Future<void> onLoad() async {
    await addAll([
      Background(),
      Ground(),
      tiger = Tiger(),
    ]);
    interval.onTick = () => add(CloudGroup());
  }

  @override
  void onMouseMove(PointerHoverInfo info) {
    tiger.move(isLeft: info.raw.delta.dx.isNegative);
    super.onMouseMove(info);
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }

  @override
  void onTap() {
    super.onTap();
    tiger.jump();
  }
}
