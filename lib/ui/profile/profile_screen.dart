import 'package:flutter/material.dart';
import 'package:skl_ecommerce_2/consts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushNamed(context, '/cataloge');
          },
        ),
        title: const Text('Profile'),
        centerTitle: true
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Picture Section
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 4,
                      child: GestureDetector(
                        onTap: () {
                          // Logic for changing profile picture
                        },
                        child: const CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.camera_alt, size: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Azzahra Rinaldi',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'www@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              // Profile Details Section
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Full Name'),
                subtitle: const Text('Azzahra Rinaldi'),
                trailing: const Icon(Icons.edit),
                onTap: () {
                  // Edit full name logic
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Email Address'),
                subtitle: const Text('www@gmail.com'),
                trailing: const Icon(Icons.edit),
                onTap: () {
                  // Edit email logic
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Phone Number'),
                subtitle: const Text('+1234567890'),
                trailing: const Icon(Icons.edit),
                onTap: () {
                  // Edit phone number logic
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Address'),
                subtitle: const Text('Jakarta, Indonesia'),
                trailing: const Icon(Icons.edit),
                onTap: () {
                  // Edit address logic
                },
              ),
              const Divider(),
              const SizedBox(height: 20),
              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Save changes logic
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: primaryColor
                  ),
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                    ),
                  ),
                  onLongPress: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Update save"))
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}