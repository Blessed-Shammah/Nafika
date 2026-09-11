import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'queue_screen.dart';
import '../providers/auth_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nafika'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authProvider.notifier).signOut();
            },
            tooltip: 'Sign Out',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Where are you heading?',
                    prefixIcon: Icon(Icons.search, color: Colors.white54),
                  ),
                ),
                const SizedBox(height: 24),
                
                // Map Placeholder
                const Text(
                  'Map View',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white10,
                      width: 1,
                    ),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.map, size: 48, color: Colors.white30),
                        SizedBox(height: 8),
                        Text('Interactive Map Placeholder', style: TextStyle(color: Colors.white30)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                
                // Safe Waiting Zones
                const Text(
                  'Safe Waiting Zones',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                _buildSafeZoneCard(
                  context,
                  title: 'Shell Petrol Station (Westlands)',
                  subtitle: '24/7 Security • Well lit',
                  icon: Icons.local_gas_station,
                ),
                const SizedBox(height: 12),
                _buildSafeZoneCard(
                  context,
                  title: 'CBD Archives Area',
                  subtitle: 'City Council Security • Busy area',
                  icon: Icons.security,
                ),
                
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const QueueScreen()),
                      );
                    },
                    child: const Text('Join Queue'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSafeZoneCard(BuildContext context, {required String title, required String subtitle, required IconData icon}) {
    return Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          child: Icon(icon, color: Theme.of(context).colorScheme.primary),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.white70)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white54),
      ),
    );
  }
}
