import 'package:flutter/material.dart';
import 'package:uts_mobile_programming/models/api_response.dart';
import 'package:uts_mobile_programming/models/user.dart';
import 'package:uts_mobile_programming/services/user_services.dart';
import 'package:uts_mobile_programming/widget/app_bar_widget.dart';
import 'package:uts_mobile_programming/screen/login.dart';

//SCREEN UNTUK ACCOUNT USER
class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  User? user; 
  bool isLoading = true; 

  @override
  void initState() {
    super.initState();
    _loadUserDetails();
  }

//ambil data dari database
  Future<void> _loadUserDetails() async {
    ApiResponse apiResponse = await getUserDetail();
    if (apiResponse.data != null) {
      setState(() {
        user = apiResponse.data as User; 
        isLoading = false; 
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

//function utnuk logout
  Future<void> _logout() async {
    bool success = await logout();
    if (success) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const Login()),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to log out')),
      );
    }
  }

//function untuk delete account
  Future<void> _deleteAccount() async {
  bool confirm = await _showDeleteConfirmationDialog();
  if (confirm) {
    ApiResponse apiResponse = await deleteAccount(); 
    if (apiResponse.success) {
      String message = apiResponse.data is String 
          ? apiResponse.data as String 
          : 'Account deleted successfully.'; 

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
      _logout(); // Logout after deleting account
    } else {
      String errorMessage = apiResponse.error ?? 'Failed to delete account.';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }
}


//pop up delete confirmation
  Future<bool> _showDeleteConfirmationDialog() async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text('Are you sure you want to delete your account? This action cannot be undone.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false), 
              child: const Text('Cancel', style: TextStyle(fontWeight: FontWeight.w700),),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true), 
              child: const Text(
                'Delete',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red, 
                ),
              ),
            ),
          ],
        );
      },
    ) ?? false; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        showBackArrow: false,
        actions: [],
      ),
      body: isLoading 
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        elevation: 5,
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage("assets/profile.jpeg"),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("Change Profile Picture",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.blueAccent,
                            )),
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 20),
                    const Text(
                      "Profile Information:",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    buildProfileRow('Name', '${user?.fname} ${user?.lname}', context),
                    const SizedBox(height: 20),
                    buildProfileRow('Username', user?.username ?? '', context),
                    const SizedBox(height: 30),
                    const Divider(),
                    const SizedBox(height: 20),
                    const Text(
                      "Personal Information:",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    buildProfileRow('Email', user?.email ?? '', context),
                    const SizedBox(height: 20),
                    buildProfileRow('Phone Num', user?.phoneNum ?? '', context),
                    const SizedBox(height: 20),
                    buildProfileRow('Address', user?.address ?? 'Not set', context),
                    const SizedBox(height: 20),
                    buildProfileRow('Date of Birth', user?.dob ?? 'Not set', context),
                    const SizedBox(height: 30),
                    const Divider(),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: _logout,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 255, 231, 197),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        ),
                        child: const Text(
                          "LOG OUT",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 0, 0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: _deleteAccount,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 255, 231, 197),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        ),
                        child: const Text(
                          "DELETE ACCOUNT",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 0, 0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

//widget untuk bikin profile 
  Widget buildProfileRow(String label, String value, BuildContext context, {VoidCallback? onTap}) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (onTap != null)
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: onTap,
          ),
      ],
    );
  }
}
