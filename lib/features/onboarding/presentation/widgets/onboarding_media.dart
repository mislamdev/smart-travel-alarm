import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../data/onboarding_slide.dart';

class OnboardingMedia extends StatefulWidget {
  final MediaType type;
  final String path;
  final double height;
  final BorderRadius borderRadius;

  const OnboardingMedia({
    super.key,
    required this.type,
    required this.path,
    required this.height,
    required this.borderRadius,
  });

  @override
  State<OnboardingMedia> createState() => _OnboardingMediaState();
}

class _OnboardingMediaState extends State<OnboardingMedia>
    with AutomaticKeepAliveClientMixin {
  VideoPlayerController? _vc;
  bool _loading = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _initIfVideo();
  }

  @override
  void didUpdateWidget(covariant OnboardingMedia oldWidget) {
    super.didUpdateWidget(oldWidget);

    // ✅ If type/path changes, rebuild controller
    final changed =
        oldWidget.type != widget.type || oldWidget.path != widget.path;
    if (changed) {
      _disposeController();
      _initIfVideo();
    }
  }

  void _initIfVideo() {
    if (widget.type != MediaType.video) return;

    _loading = true;
    final controller = VideoPlayerController.asset(widget.path);
    _vc = controller;

    controller
      ..setLooping(true)
      ..setVolume(0.0)
      ..initialize()
          .then((_) {
            if (!mounted) return;
            setState(() => _loading = false);
            controller.play();
          })
          .catchError((_) {
            if (!mounted) return;
            setState(() => _loading = false);
          });
  }

  void _disposeController() {
    final c = _vc;
    _vc = null;
    if (c != null) {
      c.pause();
      c.dispose();
    }
  }

  @override
  void dispose() {
    _disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: SizedBox(
        height: widget.height,
        width: double.infinity,
        child: widget.type == MediaType.image
            ? Image.asset(widget.path, fit: BoxFit.cover)
            : _buildVideo(),
      ),
    );
  }

  Widget _buildVideo() {
    final vc = _vc;
    if (_loading || vc == null || !vc.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        width: vc.value.size.width,
        height: vc.value.size.height,
        child: VideoPlayer(vc),
      ),
    );
  }
}
