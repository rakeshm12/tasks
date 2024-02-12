import 'package:flutter_test/flutter_test.dart';
import 'package:tasks/app/modules/profile/controllers/profile_controller.dart';

void main() {
  test('on tap load more page should increase', () {
    final controller = ProfileController();

    final val = controller.page;

    expect(val, 1);


  });
}
