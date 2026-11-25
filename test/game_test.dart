import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kelime_hafizasi/oyun_kelime_hafizasi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kelimeHafizasiConfig.title.length, 33);
    expect(kelimeHafizasiConfig.tagline.length, 33);
    for (final s in kelimeHafizasiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kelimeHafizasiConfig.gameId, kelimeHafizasiId);
    expect(kelimeHafizasiRules.gameId, kelimeHafizasiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kelimeHafizasiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kelimeHafizasiId, optionalMechanics: kelimeHafizasiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(kelimeHafizasiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
