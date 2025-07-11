import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<Map<String, Map<String, String>>> onboardingData = [
    {
      'en': {
        'title': 'Welcome to MazadyDz',
        'subtitle': 'Your trusted auction platform in Algeria',
      },
      'ar': {
        'title': 'مرحبا بك في مزادي دي زد',
        'subtitle': 'منصة المزادات الموثوقة في الجزائر',
      },
    },
    {
      'en': {
        'title': 'Easy to Use',
        'subtitle': 'User-friendly interface for everyone',
      },
      'ar': {
        'title': 'سهولة الاستخدام',
        'subtitle': 'واجهة سهلة لجميع المستخدمين',
      },
    },
    {
      'en': {
        'title': 'Join Auctions',
        'subtitle': 'Bid and win your favorite items',
      },
      'ar': {
        'title': 'انضم للمزادات',
        'subtitle': 'قدّم عروضك واربح ما تريد',
      },
    },
  ];

  String lang = 'ar'; // default language Arabic, يمكن تغييره

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final data = onboardingData[index][lang]!;
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // صورة أو رسم توضيحي (يمكن إضافة حسب الرغبة)
                        Icon(Icons.local_offer, size: 120, color: Colors.blueAccent),
                        const SizedBox(height: 40),
                        Text(
                          data['title']!,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          data['subtitle']!,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  width: currentPage == index ? 24 : 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: currentPage == index ? Colors.blueAccent : Colors.grey,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (currentPage != onboardingData.length - 1)
                    TextButton(
                      onPressed: () {
                        _pageController.jumpToPage(onboardingData.length - 1);
                      },
                      child: Text(lang == 'ar' ? 'تخطي' : 'Skip'),
                    )
                  else
                    const SizedBox(width: 70), // لتوازن التصميم
                  ElevatedButton(
                    onPressed: () {
                      if (currentPage == onboardingData.length - 1) {
                        // هنا ممكن تنقل لصفحة الدخول أو الصفحة الرئيسية
                        Navigator.pushReplacementNamed(context, '/home');
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(lang == 'ar' ? 'التالي' : 'Next'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
