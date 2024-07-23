import 'package:flutter/material.dart';
import '../models/device.dart';
import '../services/data_services.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Future<List<Device>> _devices;

  @override
  void initState() {
    super.initState();
    _devices = DataService().loadDevices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: FutureBuilder<List<Device>>(
        future: _devices,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No devices found'));
          } else {
            final devices = snapshot.data!;
            return ListView.builder(
              itemCount: devices.length,
              itemBuilder: (context, index) {
                final device = devices[index];
                return ListTile(
                  title: Text(device.name),
                  subtitle: Text('Consumption: ${device.consumption}'),
                  trailing: Switch(
                    value: device.status == 'on',
                    onChanged: (bool value) {
                      setState(() {
                        device.status = value ? 'on' : 'off';
                      });
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
    );
  }
}
