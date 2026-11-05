// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_entry_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PhoneEntryController)
final phoneEntryControllerProvider = PhoneEntryControllerProvider._();

final class PhoneEntryControllerProvider
    extends $AsyncNotifierProvider<PhoneEntryController, void> {
  PhoneEntryControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'phoneEntryControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$phoneEntryControllerHash();

  @$internal
  @override
  PhoneEntryController create() => PhoneEntryController();
}

String _$phoneEntryControllerHash() =>
    r'7c44bb96eddeefcce88e38f6ef55b430621121ba';

abstract class _$PhoneEntryController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
