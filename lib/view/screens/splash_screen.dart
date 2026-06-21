import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _progressCtrl;
  late AnimationController _fadeCtrl;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();

    _progressCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    )..forward();

    _fadeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _fadeAnim = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(parent: _fadeCtrl, curve: Curves.easeIn));

    _progressCtrl.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 300), () {
          _fadeCtrl.forward().then((_) {
            if (!mounted) return;
            Navigator.of(context).pushReplacementNamed('/wel');
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _progressCtrl.dispose();
    _fadeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return FadeTransition(
      opacity: _fadeAnim,
      child: Scaffold(
        backgroundColor: colors.primary,
        body: SizedBox.expand(
          child: Stack(
            children: [
              Positioned(
                top: -80,
                left: -80,
                child: _Circle(size: 320, color: colors.onPrimary),
              ),
              Positioned(
                bottom: -40,
                right: -60,
                child: _Circle(size: 220, color: colors.onPrimary),
              ),
              Positioned(
                top: 60,
                right: 20,
                child: _Circle(
                  size: 120,
                  color: colors.onPrimary,
                  opacity: 0.07,
                ),
              ),

              Center(
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 88,
                        height: 88,
                        decoration: BoxDecoration(
                          color: colors.onPrimary.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(26),
                          boxShadow: [
                            BoxShadow(
                              color: colors.onPrimary.withValues(alpha: 0.07),
                              blurRadius: 0,
                              spreadRadius: 12,
                            ),
                          ],
                        ),
                        child: Icon(
                          LucideIcons.feather,
                          size: 44,
                          color: colors.onPrimary,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Poultry Manager',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: colors.onPrimary,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 6),

                      // Tagline
                      Text(
                        'Farm Intelligence Platform',
                        style: TextStyle(
                          fontSize: 13,
                          color: colors.onPrimary.withValues(alpha: 0.7),
                        ),
                      ),
                      const SizedBox(height: 52),
                      // Progress bar
                      SizedBox(
                        width: 160,
                        child: AnimatedBuilder(
                          animation: _progressCtrl,
                          builder: (_, _) => ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: LinearProgressIndicator(
                              value: _progressCtrl.value,
                              minHeight: 3,
                              backgroundColor: colors.onPrimary.withValues(
                                alpha: 0.2,
                              ),
                              valueColor: AlwaysStoppedAnimation(
                                colors.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      Text(
                        'Loading…',
                        style: TextStyle(
                          fontSize: 11,
                          color: colors.onPrimary.withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  final double size;
  final double opacity;
  final Color color;

  const _Circle({required this.size, required this.color, this.opacity = 0.05});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withValues(alpha: opacity),
      ),
    );
  }
}
