import 'dart:convert';
import 'package:application/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeState();
}

class _HomeState extends State<HomeView> {
  List data = [];
  List<String> classess = ["X", "XI", "XII"];
  String classvalue = "";
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var url = Uri.parse("https://test123.alapalap.fun/api/student");
    await http.get(url).then((response) async {
      var jsonData = await jsonDecode(response.body);
      setState(() {
        data = jsonData['data'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      children: [
        const CustomAppbar(), // Menempatkan CustomAppbar di luar ListView
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: screenheight * 0.5,
                    builder: Column
                      return Sizedbox(
                        
                      )
                  )
                },
              )
              if (data.isEmpty) const Text('Loading...'),
              for (int idx = 0; idx < data.length; idx++) ...[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    color: Colors.grey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(data[idx]['fname']),
                        Text(data[idx]['lname']),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    ),
  );
}
}
