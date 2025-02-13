import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Alpha',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue, Colors.white],
                ),
              ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [// Logo Section
                      const LogoSection(),
                      const SizedBox(height: 32),

                      // Login Form
                      Container(
                        padding: const EdgeInsets.all(24.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'LOGIN',
                              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Please login to our account.',
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            const SizedBox(height: 16),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Username',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(),
                              ),
                              obscureText: true,
                            ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const AdminDashboardPage()),
                                      );
                                    },
                                    child: const Text('LOGIN'),
                                  ),
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminHomePage(),
    );
  }
}

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  Widget _currentPage = DashboardPage();

  void _onMenuSelected(String menu) {
    setState(() {
      if (menu == 'Dashboard') {
        _currentPage = DashboardPage();
      } else if (menu == 'Analysis') {
        _currentPage = AnalysisPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Admin123"),
              accountEmail: null,
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 50, color: Colors.blue),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Dashboard"),
              onTap: () => _onMenuSelected('Dashboard'),
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text("Users"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UsersPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.analytics),
              title: Text("Analysis"),
              onTap: () => _onMenuSelected('Analysis'),
            ),
            ListTile(
              leading: Icon(Icons.monitor_heart),
              title: Text("EEG Session"),
              onTap: () {
                Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) => EEGSessionPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                // Navigate back to the LoginPage and replace the current route
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Admin Dashboard"),
      ),
      body: _currentPage,
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome Admin!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Card(
            color: Colors.lightBlue[50],
            child: ListTile(
              leading: Icon(Icons.group, size: 50),
              title: Text("Users", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text("Berisi data pengguna aplikasi, dll"),
              onTap: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UsersPage()),
              );},
            ),
          ),
          SizedBox(height: 10),
          Card(
            color: Colors.lightBlue[50],
            child: ListTile(
              leading: Icon(Icons.analytics, size: 50),
              title: Text("Analysis", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text("Analisis EEG dan EKG"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnalysisPage()),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Card(
            color: Colors.lightBlue[50],
            child: ListTile(
              leading: Icon(Icons.monitor_heart, size: 50),
              title: Text("EEG Session", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text("Kelola sesi EEG"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EEGSessionPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users Management"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Users List",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Contoh data, ganti dengan data asli
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.lightBlue[50],
                    child: ListTile(
                      leading: Icon(Icons.person, size: 40, color: Colors.blue),
                      title: Text("User ${index + 1}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      subtitle: Text("user${index + 1}@example.com"),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // Tambahkan logika untuk menghapus pengguna
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnalysisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Analysis"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Analisis Data",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.purple[50],
                    child: InkWell(
                      onTap: () {
                        // Navigasi ke halaman detail EEG
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Icon(Icons.monitor_heart, size: 50, color: Colors.purple),
                            SizedBox(height: 10),
                            Text(
                              "EEG Analysis",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Analisis data EEG",
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Card(
                    color: Colors.blue[50],
                    child: InkWell(
                      onTap: () {
                        // Navigasi ke halaman detail EKG
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Icon(Icons.heart_broken, size: 50, color: Colors.blue),
                            SizedBox(height: 10),
                            Text(
                              "EKG Analysis",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Analisis data EKG",
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Recent Analysis",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Contoh data, ganti dengan data asli
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey[100],
                    child: ListTile(
                      leading: Icon(Icons.analytics, size: 40, color: Colors.green),
                      title: Text("Analysis ${index + 1}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      subtitle: Text("Tanggal: 2023-10-${index + 1}"),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_forward, color: Colors.blue),
                        onPressed: () {
                          // Navigasi ke detail analisis
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuSessionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Start New EEG Session"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose Session Type",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // Menampilkan 2 item per baris
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildSessionCard("Audio", Icons.audiotrack, Colors.blue, () {
                    // Logika untuk memulai sesi Audio
                    print("Audio Session Selected");
                  }),
                  _buildSessionCard("Image", Icons.image, Colors.green, () {
                    // Logika untuk memulai sesi Image
                    print("Image Session Selected");
                  }),
                  _buildSessionCard("Video", Icons.videocam, Colors.orange, () {
                    // Logika untuk memulai sesi Video
                    print("Video Session Selected");
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSessionCard(String title, IconData icon, Color color, VoidCallback onTap) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
                color: color,
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EEGSessionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EEG Session"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "EEG Session Management",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Card(
              color: Colors.purple[50],
              child: ListTile(
                leading: Icon(Icons.analytics, size: 40, color: Colors.purple),
                title: Text("Start New EEG Session", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                subtitle: Text("Mulai sesi EEG baru untuk pengguna"),
                onTap: () {
                  // Navigasi ke MenuSessionPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuSessionPage()),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Card(
              color: Colors.purple[50],
              child: ListTile(
                leading: Icon(Icons.history, size: 40, color: Colors.purple),
                title: Text("View EEG Session History", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                subtitle: Text("Lihat riwayat sesi EEG"),
                onTap: () {
                  // Tambahkan logika untuk melihat riwayat sesi EEG
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        const Text(
          'NEUROBLISS',
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        Lottie.asset(
          'assets/logo_brain.json',
          width: 450,
          height: 450,
        ),

      ],
    );
  }
}