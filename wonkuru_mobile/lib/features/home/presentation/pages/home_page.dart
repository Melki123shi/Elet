import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:let/features/chat/presentation/pages/chat_page.dart';
import 'package:let/features/jobs/jobs_post_page.dart';
import 'package:let/features/settings/user_info.dart';
import 'package:let/features/community/presentation/pages/communities.dart';
import 'package:let/features/profile/presentation/pages/profile_page.dart';
import 'package:let/features/home/presentation/pages/posts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final List<Widget> screens = const [
    Posts(),
    OsiPage(),
    JobPostsPage(),
    NotificationsPage(),
    ProfilePage(),
  ];

  int _selectedIndex = 0;
  bool isSidebarOpen = false;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _slideAnimation = Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _scaleAnimation = Tween<double>(begin: 0.7, end: 1.0)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _opacityAnimation = Tween<double>(begin: 0.0, end: 0.5)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  void toggleSidebar() {
    setState(() {
      isSidebarOpen = !isSidebarOpen;
      isSidebarOpen ? _animationController.forward() : _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
       backgroundColor:Color.fromARGB(148, 13, 34, 67),

        title: Row(
             
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: toggleSidebar,
              child: const Icon(
                Icons.sort_rounded,
                color: Colors.white,
                size: 35,
              ),
            ),
            Center(child: Text("Tawaki", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Color(0xFF04FAA0)),)),
            InkWell(
              onTap: () {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const MessagesPage(),
    ),
  );
},

              child: const Icon(
                Icons.message,
                size: 25,
                color: Colors.white
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          screens[_selectedIndex],
          if (isSidebarOpen)
            Opacity(
              opacity: _opacityAnimation.value,
              child: GestureDetector(
                onTap: toggleSidebar,
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          SlideTransition(
            position: _slideAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: SafeArea(
                child: Container(
                  width: 250.0,
                  // color: Color(0xFF0D2243),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      const Padding(
                        padding:  EdgeInsets.all(16.0),
                        child: CircleAvatar(
                          radius: 50,
                          // backgroundImage: AssetImage('assets/profile_pic.png'), // Replace with your image asset
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Username',
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.home, color: Colors.white),
                        title: const Text('Home', style: TextStyle(color: Colors.white)),
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                            toggleSidebar();
                          });
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.people, color: Colors.white),
                        title: const Text('Profile', style: TextStyle(color: Colors.white)),
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                            toggleSidebar();
                          });
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.call, color: Colors.white),
                        title: const Text('Contact', style: TextStyle(color: Colors.white)),
                        onTap: () {
                          setState(() {
                            _selectedIndex = 2;
                            toggleSidebar();
                          });
                        },
                      ),
                      // Add more items here
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: isSidebarOpen
          ? null
          : CurvedNavigationBar(
              index: _selectedIndex,
              backgroundColor: Colors.transparent,
              color: Color.fromARGB(225, 13, 34, 67),
              animationDuration: const Duration(milliseconds: 300),
              items: const <Widget>[
                Icon(Icons.home, size: 25,  color: Colors.white),
                Icon(Icons.people, size: 25, color: Colors.white),
                Icon(Icons.cases_rounded, size: 25,  color: Colors.white),
                Icon(Icons.notification_add, size: 25, color: Colors.white),
                Icon(Icons.person, size: 25, color: Colors.white),
              ],
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
