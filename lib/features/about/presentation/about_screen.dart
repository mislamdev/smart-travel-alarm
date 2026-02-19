import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common_widgets/app_gradient_background.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'About',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      extendBodyBehindAppBar: true,
      body: AppGradientBackground(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 10),

            // App Icon
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/app_icon.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // App Name
            const Text(
              'Smart Travel Alarm',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 8),

            // Version
            const Text(
              'Version 2.1.0',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),

            const SizedBox(height: 10),

            // Description
            Text(
              'A modern Flutter mobile application designed to help travelers set location-based alarms, ensuring they never miss their destination during their journey.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),

            const SizedBox(height: 40),

            // Developer Section
            _buildSectionTitle('Developer'),
            const SizedBox(height: 16),

            _buildInfoCard(
              icon: Icons.person,
              title: 'Md Mazharul Islam',
              subtitle: 'Software Engineer & \nServer Administrator',
            ),

            const SizedBox(height: 30),

            // Contact Section
            _buildSectionTitle('Contact'),
            const SizedBox(height: 16),

            _buildContactCard(
              icon: FontAwesomeIcons.envelope,
              title: 'Email',
              subtitle: 'mislam@m4a.dev',
              onTap: () => _launchUrl('mailto:mislam@m4a.dev'),
            ),

            const SizedBox(height: 12),

            _buildContactCard(
              icon: FontAwesomeIcons.github,
              title: 'GitHub',
              subtitle: 'github.com/mislamdev',
              onTap: () => _launchUrl('https://github.com/mislamdev'),
            ),

            const SizedBox(height: 12),

            _buildContactCard(
              icon: FontAwesomeIcons.globe,
              title: 'Website',
              subtitle: 'mislam.miit.uk',
              onTap: () => _launchUrl('https://mislam.miit.uk'),
            ),

            const SizedBox(height: 12),

            _buildContactCard(
              icon: FontAwesomeIcons.linkedin,
              title: 'LinkedIn',
              subtitle: 'linkedin.com/in/mislame',
              onTap: () => _launchUrl('https://www.linkedin.com/in/mislame'),
            ),

            const SizedBox(height: 12),

            _buildContactCard(
              icon: FontAwesomeIcons.twitter,
              title: 'Twitter',
              subtitle: '@mislam_dev',
              onTap: () => _launchUrl('https://twitter.com/mislamdev'),
            ),

            const SizedBox(height: 30),

            // License Section
            _buildSectionTitle('License'),
            const SizedBox(height: 16),

            _buildInfoCard(
              icon: Icons.description,
              title: 'MIT License',
              subtitle: 'Open Source Software',
            ),

            const SizedBox(height: 30),

            // Credits
            _buildSectionTitle('Credits'),
            const SizedBox(height: 16),

            Text(
              '• Flutter team for the amazing framework\n'
              '• Google Fonts for Poppins typography\n'
              '• Riverpod community for state management\n'
              '• All open source contributors',
              style: TextStyle(
                fontSize: 14,
                height: 1.8,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),

            const SizedBox(height: 40),

            // Copyright
            Text(
              '© 2026 M Islam\nAll rights reserved',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withValues(alpha: 0.6),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF6A00FF).withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF6A00FF).withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: FaIcon(icon, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white.withValues(alpha: 0.5),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
