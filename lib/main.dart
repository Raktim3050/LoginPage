import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool ispass = true;

  @override
  Widget build(BuildContext context) {
    // Create button style that stands out
    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 60),
      backgroundColor: Colors.teal, // Complementary button color
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Login Page',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold)), // White text for contrast
      ),
      body: Container(
        // Apply a more balanced gradient
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.shade400, Colors.blue.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/raktim2.jpeg"),
                  radius: 50,
                ),
              ),
              Divider(
                height: 30,
                color: Colors.grey[400],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      color: Colors.white, // White text on gradient
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  style: TextStyle(color: Colors.white), // White text input
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.white, // White text
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: ispass,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      color: Colors.white, // Adjust text color for readability
                      fontWeight: FontWeight.w800,
                    ),
                    prefixIcon:
                        const Icon(Icons.password_rounded, color: Colors.white),
                    suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                        ispass ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white, // White icon for visibility
                      ),
                    ),
                  ),
                  style:
                      const TextStyle(color: Colors.white), // White text input
                  maxLength: 10,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: buttonStyle,
                  child: Text('Submit', style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      ispass = !ispass;
    });
  }
}
