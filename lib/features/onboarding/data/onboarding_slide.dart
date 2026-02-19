enum MediaType { image, video }

class OnboardingSlide {
  final String title;
  final String subtitle;
  final MediaType mediaType;
  final String mediaPath; // asset path

  const OnboardingSlide({
    required this.title,
    required this.subtitle,
    required this.mediaType,
    required this.mediaPath,
  });
}
