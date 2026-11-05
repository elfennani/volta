import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:volta/data/remote/api_service.dart';

part 'phone_entry_controller.g.dart';


@Riverpod(keepAlive: true)
@riverpod
class PhoneEntryController extends _$PhoneEntryController {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> requestCode(String phone) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      // Artificial delay
      await Future.delayed(.new(seconds: 2));
      final apiService = ref.read(apiServiceProvider);
      await apiService.requestCode(phone);
    });
  }
}
