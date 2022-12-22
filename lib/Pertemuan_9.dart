import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uas_frontend_72200423/main.dart';

class Pertemuan_9 extends StatefulWidget {
  const Pertemuan_9({super.key, required this.title});

  final String title;

  @override
  State<Pertemuan_9> createState() => _Pertemuan_9State();
}
class _Pertemuan_9State extends State<Pertemuan_9> {
  int _counter = 2;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: new InputDecoration(
                  labelText:  "Username",
                  hintText: "Teks yang akan dimasukkan",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5)
                  )
              ),
            ),
            Padding(
                padding: EdgeInsets.all(5)
            ),
            TextFormField(
              decoration: new InputDecoration(
                labelText:  "Password",
                hintText: "Teks yang akan dimasukkan",
                border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5)
                ),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text(
              "Submit",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            ),
            ElevatedButton(
              child: Text(
                  "Logout"
              ),
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 0);
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => const MyHomePage(title: "Home Page",)),
                // );
              },
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}