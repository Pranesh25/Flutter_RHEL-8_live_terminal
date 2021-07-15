import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  web() async {
    print("called");
    var url =
        Uri.http("http://192.168.43.41", "/cgi-bin/test7.py?x=cmd", {"x": cmd});
    var response = await http.get(url);
    print(response.body);
    print(cmd);
  }

  late String cmd;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pranesh Prashar"),
        ),
        body: Column(
          children: [
            Text("enter your command"),
            TextField(
              onChanged: (value) {
                cmd = value;
              },
              autocorrect: false,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.print),
                hintText: "enter your command here",
              ),
            ),
            TextButton(
              onPressed: web,
              child: Text("click me "),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
