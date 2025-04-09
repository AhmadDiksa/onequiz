import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// AppBar untuk menampilkan judul dan gambar profil
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
/// Constructor untuk ProfileScreen
  /// Menggunakan super.key untuk menginisialisasi widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        // title: Text('Profile', style: GoogleFonts.poppins()),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Bagian Profil Header
            _buildProfileHeader(),
            SizedBox(height: 20),

            // Bagian Activities
            _buildActivitiesCard(),
            SizedBox(height: 20),

            // Bagian My Class
            _buildMyClassCard(context),
          ],
        ),
      ),
    );
  }
/// Fungsi untuk membangun header profil
  /// Menggunakan Card untuk memberikan efek bayangan dan sudut melengkung
  Widget _buildProfileHeader() {
    return Card(
      color: Colors.deepPurple[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/61931922?v=4',
              ), // Ganti dengan URL atau asset gambar profil
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "John Doe", // Ganti dengan nama pengguna
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "@johndoe1 Student", // Ganti dengan username dan status
                  style: GoogleFonts.poppins(color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

/// Fungsi untuk membangun kartu aktivitas
  /// Menggunakan Card untuk memberikan efek bayangan dan sudut melengkung
  Widget _buildActivitiesCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.list_alt),
                SizedBox(width: 8),
                Text(
                  "Activities",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Quiz\n2/4 Done", style: GoogleFonts.poppins()),
                Text("Poin\n2090", style: GoogleFonts.poppins()),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Top 3\n2 x", style: GoogleFonts.poppins()),
                Text("MVP\n2 x", style: GoogleFonts.poppins()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMyClassCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.class_),
                SizedBox(width: 8),
                Text(
                  "My Class",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            _buildClassListItem("2023F"),
            _buildClassListItem("English Club"),
            _buildClassListItem("Courses"),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Aksi ketika tombol "Add Class" ditekan
                // Anda bisa membuka dialog atau halaman untuk menambahkan kelas
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple[200],
                textStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              child: Text("Add Class"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClassListItem(String className) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(className, style: GoogleFonts.poppins()),
          Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}
