import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common_widgets/app_gradient_background.dart';
import '../../../common_widgets/gradient_button.dart';
import '../../../main.dart';
import '../data/onboarding_slide.dart';
import 'widgets/onboarding_media.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int index = 0;

  final List<OnboardingSlide> slides = const [
    OnboardingSlide(
      title: 'Discover the world,\none journey at a time.',
      subtitle:
          'From hidden gems to iconic destinations, we make travel simple and unforgettable.',
      mediaType: MediaType.video,
      mediaPath: 'assets/videos/onboarding_01.mp4',
    ),
    OnboardingSlide(
      title: 'Explore new horizons,\none step at a time.',
      subtitle:
          'Every trip holds a story waiting to be lived. Let us guide you.',
      mediaType: MediaType.video,
      mediaPath: 'assets/videos/onboarding_02.mp4',
    ),
    OnboardingSlide(
      title: 'See the beauty, one\njourney at a time.',
      subtitle: 'Travel made simple and exciting—discover places you’ll love.',
      mediaType: MediaType.video,
      mediaPath: 'assets/videos/onboarding_03.mp4',
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Only hide system UI on Android/iOS, not on Linux
    if (Platform.isAndroid || Platform.isIOS) {
      // Hide system UI overlays to prevent "MY APP" text from showing
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      // Make status bar transparent
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.transparent,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    // Restore system UI when leaving onboarding (Android/iOS only)
    if (Platform.isAndroid || Platform.isIOS) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
    super.dispose();
  }

  void _goToLocation() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.location);
  }

  void _skip() => _goToLocation();

  void _next() {
    if (index < slides.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeInOut,
      );
    } else {
      _goToLocation();
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: AppGradientBackground(
        useSafeArea: false, // ✅ IMPORTANT: media goes under status bar
        child: Stack(
          children: [
            /// PAGE CONTENT (no SafeArea)
            PageView.builder(
              controller: _controller,
              itemCount: slides.length,
              onPageChanged: (i) => setState(() => index = i),
              itemBuilder: (_, i) {
                final item = slides[i];

                return Column(
                  children: [
                    /// ✅ MEDIA: starts from absolute top (behind status bar)
                    OnboardingMedia(
                      key: ValueKey(item.mediaPath),
                      type: item.mediaType,
                      path: item.mediaPath,
                      height: h * 0.55,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.zero,
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                    ),

                    /// ✅ CONTENT: padded
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w500,
                                height: 1.15,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              item.subtitle,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.45,
                                color: Colors.white.withOpacity(.78),
                              ),
                            ),
                            const SizedBox(height: 24),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                slides.length,
                                (dot) => AnimatedContainer(
                                  duration: const Duration(milliseconds: 220),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    color: dot == index
                                        ? const Color(0xFF6A00FF)
                                        : Colors.white.withOpacity(.25),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 60),

                            GradientButton(
                              text: index == slides.length - 1
                                  ? "Get Started"
                                  : "Next",
                              onTap: _next,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            /// ✅ Skip floats top-right BUT protected from notch
            Positioned(
              top: 8,
              right: 12,
              child: SafeArea(
                bottom: false,
                child: TextButton(
                  onPressed: _skip,
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                  child: const Text(
                    "Skip",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
