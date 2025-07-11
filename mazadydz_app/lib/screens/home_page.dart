import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../widgets/feature_card.dart';
import 'settings_page.dart';
import 'search_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    // ✅ تحضير الصفحات داخل build بعد توفر context
    final List<Widget> pages = [
  _buildMainContent(context),
  const SearchPage(),
  const ProfilePage(),
];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: Text('app_name'.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: pages[_pageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _pageIndex,
        backgroundColor: const Color(0xFFF8FAFC),
        color: Colors.blue.shade900,
        buttonBackgroundColor: Colors.blueAccent,
        height: 60,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          // HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1e3a8a), Color(0xFF1e40af)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.network(
                      'https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/dca2ffcd-3b5f-4231-b488-32303a01afd9.png',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Colors.white, Color(0xFFe0f2fe)],
                  ).createShader(bounds),
                  child: Text(
                    'app_name'.tr(),
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                      shadows: [
                        Shadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 4,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'app_tagline'.tr(),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFFBFDBFE),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    Image.network(
                      'https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/a7202c8a-a067-4be7-99a9-f07ff4ef634a.png',
                      height: 50,
                    ),
                    Image.network(
                      'https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/53cc0c4d-1166-4dcb-be14-30ba3b3f54e2.png',
                      height: 50,
                    ),
                  ],
                )
              ],
            ),
          ),

          const SizedBox(height: 30),

          // FEATURES
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(
                  'features'.tr(),
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(
                  thickness: 2,
                  color: Colors.blueAccent,
                  endIndent: 150,
                  indent: 150,
                ),
                const SizedBox(height: 20),
                LayoutBuilder(
                  builder: (context, constraints) {
                    int columns = 1;
                    if (screenWidth > 600) {
                      columns = 3;
                    } else if (screenWidth > 400) {
                      columns = 2;
                    }

                    return GridView.count(
                      crossAxisCount: columns,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        FeatureCard(
                          iconUrl:
                              'https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/50599dd3-fb88-4e3f-b84a-2df0539aec0d.png',
                          title: 'user_experience'.tr(),
                          description: 'user_experience_desc'.tr(),
                        ),
                        FeatureCard(
                          iconUrl:
                              'https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/b215cfdd-da0f-4236-9062-398e5e5a6f75.png',
                          title: 'support'.tr(),
                          description: 'support_desc'.tr(),
                        ),
                        FeatureCard(
                          iconUrl:
                              'https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/8e75f460-eef2-4a83-bbf0-88cfc158a51f.png',
                          title: 'auction_platform'.tr(),
                          description: 'auction_platform_desc'.tr(),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
