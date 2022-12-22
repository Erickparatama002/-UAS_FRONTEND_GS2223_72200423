import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Mahasiswa_add extends StatefulWidget {
  const Mahasiswa_add({Key? key}) : super(key: key);

  @override
  State<Mahasiswa_add> createState() => _Mahasiswa_addState();
}

class _Mahasiswa_addState extends State<Mahasiswa_add> {
  final _formKey = GlobalKey<FormState>();

  Future<List>? resp;

  TextEditingController namaController = TextEditingController(text: 'Argo');
  TextEditingController nimController = TextEditingController(text: '72120002');
  TextEditingController alamatController = TextEditingController(text: 'UKDW');
  TextEditingController emailController =
  TextEditingController(text: 'argo@staff.ukdw.ac.id');
  TextEditingController fotoController = TextEditingController(text: 'foto');
  TextEditingController nimProgmobController =
  TextEditingController(text: '72200391');

  Future<List> sendMhs(
      String nama, nim, alamat, email, foto, nimProgmob) async {
    final http.Response response = await http.post(
      Uri.parse('https://kpsi.fti.ukdw.ac.id/api/progmob/mhs/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nama': nama,
        'nim': nim,
        'alamat': alamat,
        'email': email,
        'foto': foto,
        'nim_progmob': nimProgmob
      }),
    );
    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load response');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Insert Mahasiswa"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            // Add TextFormFields and ElevatedButton here.
            TextFormField(
              controller: namaController,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: nimController,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: alamatController,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: emailController,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: fotoController,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: nimProgmobController,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  resp = sendMhs(
                      namaController.text,
                      nimController.text,
                      alamatController.text,
                      emailController.text,
                      fotoController.text,
                      nimProgmobController.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}