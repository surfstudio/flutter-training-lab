/// {@template onboarding_model}
/// Модель для OnboardingScreen.
/// {@endtemplate}
final class OnboardingModel implements IOnboardingModel {
  /// {@macro onboarding_model}
  const OnboardingModel();

  @override
  Future<void> saveOnboardingCompletion() async {
    // TODO(anyone): реализовать логику нажатия на кнопку.
  }
}

abstract interface class IOnboardingModel {
  Future<void> saveOnboardingCompletion();
}
