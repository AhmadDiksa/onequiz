import 'package:flutter/material.dart';
import 'package:onequiz/widgets/custom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onequiz/screens/profile_screen.dart'; // Import halaman profil
import 'package:onequiz/screens/quiz_screen.dart';
import 'package:onequiz/widgets/quiz_card.dart'; // Import QuizCard
import 'package:onequiz/widgets/quiz_code_input.dart'; // Import QuizCodeInput

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // Warna background
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200], // Warna appbar
        title: Text(
          _getTitle(_currentIndex),
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/61931922?v=4'), // Contoh gambar profil
            ),
          ),
        ],
        elevation: 0, // Menghilangkan shadow appbar
      ),
      bottomNavigationBar: CustomNavbar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          _buildHomePage(), // Widget untuk tampilan home sebelumnya
          Center(child: Text("Explore Page")), // Ganti dengan halaman Explore
          Center(child: Text("Chat Page")), // Ganti dengan halaman Chat
          ProfileScreen(), // Halaman Profil
        ],
      ),
    );
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return 'Lets Play';
      case 1:
        return 'Explore';
      case 2:
        return 'Chat';
      case 3:
        return 'Profile';
      default:
        return 'Lets Play';
    }
  }

  Widget _buildHomePage() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Bagian "Enter your quiz code"
            QuizCodeInput(),
            SizedBox(height: 20),

            // Bagian "Recent Quiz"
            Text(
              "Recent Quiz",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            QuizCard(
              title: "Pemmrograman Dasar",
              subtitle: "10/10 Question",
              icon: Icons.code,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen()),
                );
              },
            ),
            QuizCard(
              title: "Pemmrograman Web",
              subtitle: "10/10 Question",
              icon: Icons.web,
            ),

            SizedBox(height: 20),

            // Bagian "Live Quiz"
            Text(
              "Live Quiz",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            QuizCard(
              title: "Jaringan Komunikasi",
              subtitle: "36 users are playing",
              icon: Icons.network_check,
            ),
            QuizCard(
              title: "Pemmrograman Game",
              subtitle: "10/10 Question",
              icon: Icons.gamepad,
            ),
          ],
        ),
      ),
    );
  }
}