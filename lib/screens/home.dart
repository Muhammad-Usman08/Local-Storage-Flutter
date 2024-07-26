import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String loginIn = 'User not login';
  @override
  void initState() {
    super.initState();
    fetchInitalData();
  }
  // num num1 = 0;
  // num num2 = 0;
  // num num3 = 0;

  fetchInitalData() async {
    await getLoginState();
  }

  getLoginState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    loginIn = prefs.getString('isLogin')!;
    setState(() {});
  }

  login() async {
    // print('Hello World 1');
    // await Future.delayed(Duration(seconds: 2));
    // print('Hello World 2');
    // print('Hello World 3');
    // print('Hello World 4');
    // print('Hello World 5');
    //   num1++;
    //   num2++;
    //   setState(() {});
    //  await Future.delayed(Duration(milliseconds: 100));
    //   num3++;

    //Local Storage
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    loginIn = 'User login';
    await prefs.setString('isLogin', loginIn);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.blue[500],
      ),
      body: Column(
        children: [
          Text(loginIn),
          Center(
            child: ElevatedButton(
              onPressed: () {
                login();
              },
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
