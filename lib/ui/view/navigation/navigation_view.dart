import 'package:etotek_mobil/ui/view/events/events_view.dart';
import 'package:etotek_mobil/ui/view/home/home_view.dart';
import 'package:etotek_mobil/ui/view/posts/posts_view.dart';
import 'package:etotek_mobil/ui/view/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int currentPage = 0;

  final List<Widget> pagesList = [
    const HomeView(),
    const PostsView(),
    const EventsView(),
    const ProfileView(),
  ];

  final TextStyle labelStyle = const TextStyle(fontSize: 11);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: GestureDetector(onTap: () => FocusScope.of(context).unfocus(), child: pagesList[currentPage]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: StylishBottomBar(
          elevation: 10,
          hasNotch: true,
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          items: [
            BottomBarItem(
              selectedColor: Colors.blue,
              icon: const Icon(Icons.dashboard),
              title: Text(
                style: labelStyle,
                'Ana Sayfa',
              ),
            ),
            BottomBarItem(
              selectedColor: Colors.blue,
              icon: const Icon(Icons.article),
              title: Text(
                style: labelStyle,
                'Gönderiler',
              ),
            ),
            BottomBarItem(
              selectedColor: Colors.blue,
              icon: const Icon(Icons.event),
              title: Text(
                style: labelStyle,
                'Etkinlikler',
              ),
            ),
            BottomBarItem(
              selectedColor: Colors.blue,
              icon: const Icon(Icons.person),
              title: Text(style: labelStyle, 'Profil'),
            ),
          ],
          option: AnimatedBarOptions(
            barAnimation: BarAnimation.blink,
          ),
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
        ),
      ),
    );
  }
}
