import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/client_service.dart';
import 'screens/dashboard_screen.dart';
import 'screens/new_client_screen.dart';
import 'screens/client_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ClientService()),
      ],
      child: MaterialApp(
        title: 'CouldAI Client Manager',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            filled: true,
            fillColor: Colors.grey.shade50,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const DashboardScreen(),
          '/new_client': (context) => const NewClientScreen(),
          '/client_details': (context) => const ClientDetailsScreen(),
        },
      ),
    );
  }
}
