import 'package:expense_tracker/screens/add_transaction.dart';
import 'package:expense_tracker/screens/dashboard.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

enum Screen { home, add, insights}

class _AppState extends State<App> {
  Screen _currentScreen = Screen.home;
  void _onTabSelected(int index) {
    setState(() {
      _currentScreen = Screen.values[index];
    });
  }

  Widget _buildScreen() {
    switch (_currentScreen) {
      case Screen.home:
        return Dashboard();
      case Screen.add:
        return AddTransaction();
      case Screen.insights:
        return const Center(child: Text('Insights'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreen(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentScreen.index,
          onTap: _onTabSelected,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF2563EB),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Insights")
          ]
      ),
    );
  }
}
